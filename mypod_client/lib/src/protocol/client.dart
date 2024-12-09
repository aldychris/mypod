/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:mypod_client/src/protocol/address.dart' as _i3;
import 'package:mypod_client/src/protocol/company.dart' as _i4;
import 'package:mypod_client/src/protocol/employee.dart' as _i5;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i6;
import 'protocol.dart' as _i7;

/// {@category Endpoint}
class EndpointAddress extends _i1.EndpointRef {
  EndpointAddress(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'address';

  _i2.Stream<_i3.Address> echoAddress(_i2.Stream<_i3.Address> stream) =>
      caller.callStreamingServerEndpoint<_i2.Stream<_i3.Address>, _i3.Address>(
        'address',
        'echoAddress',
        {},
        {'stream': stream},
      );

  _i2.Future<List<_i3.Address>> getAddressList() =>
      caller.callServerEndpoint<List<_i3.Address>>(
        'address',
        'getAddressList',
        {},
      );
}

/// {@category Endpoint}
class EndpointAddressStream extends _i1.EndpointRef {
  EndpointAddressStream(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'addressStream';

  _i2.Future<void> setAddress({required _i3.Address address}) =>
      caller.callServerEndpoint<void>(
        'addressStream',
        'setAddress',
        {'address': address},
      );

  _i2.Stream<dynamic> addressUpdates(_i3.Address address) =>
      caller.callStreamingServerEndpoint<_i2.Stream<dynamic>, dynamic>(
        'addressStream',
        'addressUpdates',
        {'address': address},
        {},
      );
}

/// {@category Endpoint}
class EndpointCompany extends _i1.EndpointRef {
  EndpointCompany(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'company';

  _i2.Future<List<_i4.Company>> getCompanies() =>
      caller.callServerEndpoint<List<_i4.Company>>(
        'company',
        'getCompanies',
        {},
      );

  _i2.Future<_i4.Company> addCompany() =>
      caller.callServerEndpoint<_i4.Company>(
        'company',
        'addCompany',
        {},
      );

  _i2.Future<_i4.Company> updateCompany(
    int id,
    String name,
  ) =>
      caller.callServerEndpoint<_i4.Company>(
        'company',
        'updateCompany',
        {
          'id': id,
          'name': name,
        },
      );

  _i2.Future<void> deleteCompany(int id) => caller.callServerEndpoint<void>(
        'company',
        'deleteCompany',
        {'id': id},
      );

  _i2.Future<_i4.Company?> findMyCompany(String name) =>
      caller.callServerEndpoint<_i4.Company?>(
        'company',
        'findMyCompany',
        {'name': name},
      );
}

/// {@category Endpoint}
class EndpointEmployee extends _i1.EndpointRef {
  EndpointEmployee(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'employee';

  _i2.Future<_i5.Employee> addEmployee(String name) =>
      caller.callServerEndpoint<_i5.Employee>(
        'employee',
        'addEmployee',
        {'name': name},
      );

  _i2.Future<List<_i5.Employee>> getEmployee() =>
      caller.callServerEndpoint<List<_i5.Employee>>(
        'employee',
        'getEmployee',
        {},
      );
}

/// {@category Endpoint}
class EndpointExample extends _i1.EndpointRef {
  EndpointExample(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'example';

  _i2.Future<String> hello(String name) => caller.callServerEndpoint<String>(
        'example',
        'hello',
        {'name': name},
      );
}

class Modules {
  Modules(Client client) {
    auth = _i6.Caller(client);
  }

  late final _i6.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i7.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    address = EndpointAddress(this);
    addressStream = EndpointAddressStream(this);
    company = EndpointCompany(this);
    employee = EndpointEmployee(this);
    example = EndpointExample(this);
    modules = Modules(this);
  }

  late final EndpointAddress address;

  late final EndpointAddressStream addressStream;

  late final EndpointCompany company;

  late final EndpointEmployee employee;

  late final EndpointExample example;

  late final Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'address': address,
        'addressStream': addressStream,
        'company': company,
        'employee': employee,
        'example': example,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
