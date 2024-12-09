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
import 'error_enum_spy.dart' as _i2;

abstract class MyPodException
    implements
        _i1.SerializableException,
        _i1.SerializableModel,
        _i1.ProtocolSerialization {
  MyPodException._({
    required this.errorType,
    required this.message,
  });

  factory MyPodException({
    required _i2.ErrorType errorType,
    required String message,
  }) = _MyPodExceptionImpl;

  factory MyPodException.fromJson(Map<String, dynamic> jsonSerialization) {
    return MyPodException(
      errorType:
          _i2.ErrorType.fromJson((jsonSerialization['errorType'] as int)),
      message: jsonSerialization['message'] as String,
    );
  }

  _i2.ErrorType errorType;

  String message;

  MyPodException copyWith({
    _i2.ErrorType? errorType,
    String? message,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      'errorType': errorType.toJson(),
      'message': message,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      'errorType': errorType.toJson(),
      'message': message,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _MyPodExceptionImpl extends MyPodException {
  _MyPodExceptionImpl({
    required _i2.ErrorType errorType,
    required String message,
  }) : super._(
          errorType: errorType,
          message: message,
        );

  @override
  MyPodException copyWith({
    _i2.ErrorType? errorType,
    String? message,
  }) {
    return MyPodException(
      errorType: errorType ?? this.errorType,
      message: message ?? this.message,
    );
  }
}
