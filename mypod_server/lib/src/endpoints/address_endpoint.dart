import 'package:mypod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class AddressEndpoint extends Endpoint {
  final editAddressChannel = 'editAddressChannel';

  @override
  bool get requireLogin => true;

  Stream<Address> echoAddress(Session session, Stream<Address> stream) async* {
    await for (var message in stream) {
      await Address.db.updateRow(session, message);
      session.messages.postMessage(editAddressChannel, message);
      yield message;
    }
  }

  @override
  Future<void> streamOpened(StreamingSession session) async {
    session.messages.addListener(editAddressChannel, (update) {
      sendStreamMessage(session, update);
    });
  }

  @override
  Future<void> handleStreamMessage(
    StreamingSession session,
    SerializableModel message,
  ) async {
    if (message is Address) {
      await Address.db.updateRow(session, message);
    }

    session.messages.postMessage(
      editAddressChannel,
      message,
    );
  }

  Future<List<Address>> getAddressList(
    Session session,
  ) async {
    return await Address.db.find(
      session,
      orderBy: (t) => t.id,
    );
  }
}
