/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/address_endpoint.dart' as _i2;
import '../endpoints/address_stream_endpoint.dart' as _i3;
import '../endpoints/company_endpoint.dart' as _i4;
import '../endpoints/employee_endpoint.dart' as _i5;
import '../endpoints/example_endpoint.dart' as _i6;
import 'package:mypod_server/src/generated/address.dart' as _i7;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i8;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'address': _i2.AddressEndpoint()
        ..initialize(
          server,
          'address',
          null,
        ),
      'addressStream': _i3.AddressStreamEndpoint()
        ..initialize(
          server,
          'addressStream',
          null,
        ),
      'company': _i4.CompanyEndpoint()
        ..initialize(
          server,
          'company',
          null,
        ),
      'employee': _i5.EmployeeEndpoint()
        ..initialize(
          server,
          'employee',
          null,
        ),
      'example': _i6.ExampleEndpoint()
        ..initialize(
          server,
          'example',
          null,
        ),
    };
    connectors['address'] = _i1.EndpointConnector(
      name: 'address',
      endpoint: endpoints['address']!,
      methodConnectors: {
        'getAddressList': _i1.MethodConnector(
          name: 'getAddressList',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['address'] as _i2.AddressEndpoint)
                  .getAddressList(session),
        ),
        'echoAddress': _i1.MethodStreamConnector(
          name: 'echoAddress',
          params: {},
          streamParams: {
            'stream': _i1.StreamParameterDescription<_i7.Address>(
              name: 'stream',
              nullable: false,
            )
          },
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['address'] as _i2.AddressEndpoint).echoAddress(
            session,
            streamParams['stream']!.cast<_i7.Address>(),
          ),
        ),
      },
    );
    connectors['addressStream'] = _i1.EndpointConnector(
      name: 'addressStream',
      endpoint: endpoints['addressStream']!,
      methodConnectors: {
        'setAddress': _i1.MethodConnector(
          name: 'setAddress',
          params: {
            'address': _i1.ParameterDescription(
              name: 'address',
              type: _i1.getType<_i7.Address>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['addressStream'] as _i3.AddressStreamEndpoint)
                  .setAddress(
            session,
            address: params['address'],
          ),
        ),
        'addressUpdates': _i1.MethodStreamConnector(
          name: 'addressUpdates',
          params: {
            'address': _i1.ParameterDescription(
              name: 'address',
              type: _i1.getType<_i7.Address>(),
              nullable: false,
            )
          },
          streamParams: {},
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['addressStream'] as _i3.AddressStreamEndpoint)
                  .addressUpdates(
            session,
            params['address'],
          ),
        ),
      },
    );
    connectors['company'] = _i1.EndpointConnector(
      name: 'company',
      endpoint: endpoints['company']!,
      methodConnectors: {
        'getCompanies': _i1.MethodConnector(
          name: 'getCompanies',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['company'] as _i4.CompanyEndpoint)
                  .getCompanies(session),
        ),
        'addCompany': _i1.MethodConnector(
          name: 'addCompany',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['company'] as _i4.CompanyEndpoint).addCompany(session),
        ),
        'updateCompany': _i1.MethodConnector(
          name: 'updateCompany',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['company'] as _i4.CompanyEndpoint).updateCompany(
            session,
            params['id'],
            params['name'],
          ),
        ),
        'deleteCompany': _i1.MethodConnector(
          name: 'deleteCompany',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['company'] as _i4.CompanyEndpoint).deleteCompany(
            session,
            params['id'],
          ),
        ),
        'findMyCompany': _i1.MethodConnector(
          name: 'findMyCompany',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['company'] as _i4.CompanyEndpoint).findMyCompany(
            session,
            params['name'],
          ),
        ),
      },
    );
    connectors['employee'] = _i1.EndpointConnector(
      name: 'employee',
      endpoint: endpoints['employee']!,
      methodConnectors: {
        'addEmployee': _i1.MethodConnector(
          name: 'addEmployee',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['employee'] as _i5.EmployeeEndpoint).addEmployee(
            session,
            params['name'],
          ),
        ),
        'getEmployee': _i1.MethodConnector(
          name: 'getEmployee',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['employee'] as _i5.EmployeeEndpoint)
                  .getEmployee(session),
        ),
      },
    );
    connectors['example'] = _i1.EndpointConnector(
      name: 'example',
      endpoint: endpoints['example']!,
      methodConnectors: {
        'hello': _i1.MethodConnector(
          name: 'hello',
          params: {
            'name': _i1.ParameterDescription(
              name: 'name',
              type: _i1.getType<String>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['example'] as _i6.ExampleEndpoint).hello(
            session,
            params['name'],
          ),
        )
      },
    );
    modules['serverpod_auth'] = _i8.Endpoints()..initializeEndpoints(server);
  }
}
