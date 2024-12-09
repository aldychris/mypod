import 'package:mypod_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class ExampleEndpoint extends Endpoint {
  Future<String> hello(
    Session session,
    String name,
  ) async {
    if (RegExp(r'\d').hasMatch(name)) {
      final exception = MyPodException(
        errorType: ErrorType.badRequest,
        message: 'Name should not contain numbers',
      );
      session.log(
        'Name have numbers: $name',
        exception: exception,
      );
      throw exception;
    }

    return 'Hello $name';
  }
}
