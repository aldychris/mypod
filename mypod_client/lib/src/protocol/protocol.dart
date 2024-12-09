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
import 'address.dart' as _i2;
import 'company.dart' as _i3;
import 'employee.dart' as _i4;
import 'error_enum_spy.dart' as _i5;
import 'example.dart' as _i6;
import 'exception_spy.dart' as _i7;
import 'package:mypod_client/src/protocol/address.dart' as _i8;
import 'package:mypod_client/src/protocol/company.dart' as _i9;
import 'package:mypod_client/src/protocol/employee.dart' as _i10;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i11;
export 'address.dart';
export 'company.dart';
export 'employee.dart';
export 'error_enum_spy.dart';
export 'example.dart';
export 'exception_spy.dart';
export 'client.dart';

class Protocol extends _i1.SerializationManager {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i2.Address) {
      return _i2.Address.fromJson(data) as T;
    }
    if (t == _i3.Company) {
      return _i3.Company.fromJson(data) as T;
    }
    if (t == _i4.Employee) {
      return _i4.Employee.fromJson(data) as T;
    }
    if (t == _i5.ErrorType) {
      return _i5.ErrorType.fromJson(data) as T;
    }
    if (t == _i6.Example) {
      return _i6.Example.fromJson(data) as T;
    }
    if (t == _i7.MyPodException) {
      return _i7.MyPodException.fromJson(data) as T;
    }
    if (t == _i1.getType<_i2.Address?>()) {
      return (data != null ? _i2.Address.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i3.Company?>()) {
      return (data != null ? _i3.Company.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i4.Employee?>()) {
      return (data != null ? _i4.Employee.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.ErrorType?>()) {
      return (data != null ? _i5.ErrorType.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Example?>()) {
      return (data != null ? _i6.Example.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.MyPodException?>()) {
      return (data != null ? _i7.MyPodException.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<List<_i4.Employee>?>()) {
      return (data != null
          ? (data as List).map((e) => deserialize<_i4.Employee>(e)).toList()
          : null) as dynamic;
    }
    if (t == List<_i8.Address>) {
      return (data as List).map((e) => deserialize<_i8.Address>(e)).toList()
          as dynamic;
    }
    if (t == List<_i9.Company>) {
      return (data as List).map((e) => deserialize<_i9.Company>(e)).toList()
          as dynamic;
    }
    if (t == List<_i10.Employee>) {
      return (data as List).map((e) => deserialize<_i10.Employee>(e)).toList()
          as dynamic;
    }
    try {
      return _i11.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i2.Address) {
      return 'Address';
    }
    if (data is _i3.Company) {
      return 'Company';
    }
    if (data is _i4.Employee) {
      return 'Employee';
    }
    if (data is _i5.ErrorType) {
      return 'ErrorType';
    }
    if (data is _i6.Example) {
      return 'Example';
    }
    if (data is _i7.MyPodException) {
      return 'MyPodException';
    }
    className = _i11.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Address') {
      return deserialize<_i2.Address>(data['data']);
    }
    if (dataClassName == 'Company') {
      return deserialize<_i3.Company>(data['data']);
    }
    if (dataClassName == 'Employee') {
      return deserialize<_i4.Employee>(data['data']);
    }
    if (dataClassName == 'ErrorType') {
      return deserialize<_i5.ErrorType>(data['data']);
    }
    if (dataClassName == 'Example') {
      return deserialize<_i6.Example>(data['data']);
    }
    if (dataClassName == 'MyPodException') {
      return deserialize<_i7.MyPodException>(data['data']);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i11.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }
}
