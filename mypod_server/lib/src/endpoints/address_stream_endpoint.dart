import 'package:mypod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class AddressStreamEndpoint extends Endpoint {
  final editAddressChannel = 'editAddressChannel';

  @override
  bool get requireLogin => true;

  var addressData = <Address>[];

  Future<void> setAddress(Session session, {required Address address}) async {
    await Address.db.updateRow(session, address);
    session.messages.postMessage(editAddressChannel, address);
  }

  Stream addressUpdates(Session session, Address address) async* {
    var updateStream = session.messages.createStream(editAddressChannel);

    yield* Stream.fromIterable(await Address.db.find(session));

    await for (var message in updateStream) {
      await Address.db.updateRow(session, message);
      yield message;
    }
  }
}
