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
import 'address.dart' as _i2;

abstract class Employee implements _i1.TableRow, _i1.ProtocolSerialization {
  Employee._({
    this.id,
    required this.name,
    required this.addressId,
    this.address,
  });

  factory Employee({
    int? id,
    required String name,
    required int addressId,
    _i2.Address? address,
  }) = _EmployeeImpl;

  factory Employee.fromJson(Map<String, dynamic> jsonSerialization) {
    return Employee(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      addressId: jsonSerialization['addressId'] as int,
      address: jsonSerialization['address'] == null
          ? null
          : _i2.Address.fromJson(
              (jsonSerialization['address'] as Map<String, dynamic>)),
    );
  }

  static final t = EmployeeTable();

  static const db = EmployeeRepository._();

  @override
  int? id;

  String name;

  int addressId;

  _i2.Address? address;

  int? _companyEmployeesCompanyId;

  @override
  _i1.Table get table => t;

  Employee copyWith({
    int? id,
    String? name,
    int? addressId,
    _i2.Address? address,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'addressId': addressId,
      if (address != null) 'address': address?.toJson(),
      if (_companyEmployeesCompanyId != null)
        '_companyEmployeesCompanyId': _companyEmployeesCompanyId,
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      'addressId': addressId,
      if (address != null) 'address': address?.toJsonForProtocol(),
    };
  }

  static EmployeeInclude include({_i2.AddressInclude? address}) {
    return EmployeeInclude._(address: address);
  }

  static EmployeeIncludeList includeList({
    _i1.WhereExpressionBuilder<EmployeeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EmployeeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EmployeeTable>? orderByList,
    EmployeeInclude? include,
  }) {
    return EmployeeIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Employee.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Employee.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _EmployeeImpl extends Employee {
  _EmployeeImpl({
    int? id,
    required String name,
    required int addressId,
    _i2.Address? address,
  }) : super._(
          id: id,
          name: name,
          addressId: addressId,
          address: address,
        );

  @override
  Employee copyWith({
    Object? id = _Undefined,
    String? name,
    int? addressId,
    Object? address = _Undefined,
  }) {
    return Employee(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      addressId: addressId ?? this.addressId,
      address: address is _i2.Address? ? address : this.address?.copyWith(),
    );
  }
}

class EmployeeImplicit extends _EmployeeImpl {
  EmployeeImplicit._({
    int? id,
    required String name,
    required int addressId,
    _i2.Address? address,
    this.$_companyEmployeesCompanyId,
  }) : super(
          id: id,
          name: name,
          addressId: addressId,
          address: address,
        );

  factory EmployeeImplicit(
    Employee employee, {
    int? $_companyEmployeesCompanyId,
  }) {
    return EmployeeImplicit._(
      id: employee.id,
      name: employee.name,
      addressId: employee.addressId,
      address: employee.address,
      $_companyEmployeesCompanyId: $_companyEmployeesCompanyId,
    );
  }

  int? $_companyEmployeesCompanyId;

  @override
  Map<String, dynamic> toJson() {
    var jsonMap = super.toJson();
    jsonMap.addAll({'_companyEmployeesCompanyId': $_companyEmployeesCompanyId});
    return jsonMap;
  }
}

class EmployeeTable extends _i1.Table {
  EmployeeTable({super.tableRelation}) : super(tableName: 'employee') {
    name = _i1.ColumnString(
      'name',
      this,
    );
    addressId = _i1.ColumnInt(
      'addressId',
      this,
    );
    $_companyEmployeesCompanyId = _i1.ColumnInt(
      '_companyEmployeesCompanyId',
      this,
    );
  }

  late final _i1.ColumnString name;

  late final _i1.ColumnInt addressId;

  _i2.AddressTable? _address;

  late final _i1.ColumnInt $_companyEmployeesCompanyId;

  _i2.AddressTable get address {
    if (_address != null) return _address!;
    _address = _i1.createRelationTable(
      relationFieldName: 'address',
      field: Employee.t.addressId,
      foreignField: _i2.Address.t.id,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.AddressTable(tableRelation: foreignTableRelation),
    );
    return _address!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
        addressId,
        $_companyEmployeesCompanyId,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'address') {
      return address;
    }
    return null;
  }
}

class EmployeeInclude extends _i1.IncludeObject {
  EmployeeInclude._({_i2.AddressInclude? address}) {
    _address = address;
  }

  _i2.AddressInclude? _address;

  @override
  Map<String, _i1.Include?> get includes => {'address': _address};

  @override
  _i1.Table get table => Employee.t;
}

class EmployeeIncludeList extends _i1.IncludeList {
  EmployeeIncludeList._({
    _i1.WhereExpressionBuilder<EmployeeTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Employee.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Employee.t;
}

class EmployeeRepository {
  const EmployeeRepository._();

  final attachRow = const EmployeeAttachRowRepository._();

  Future<List<Employee>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EmployeeTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<EmployeeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EmployeeTable>? orderByList,
    _i1.Transaction? transaction,
    EmployeeInclude? include,
  }) async {
    return session.db.find<Employee>(
      where: where?.call(Employee.t),
      orderBy: orderBy?.call(Employee.t),
      orderByList: orderByList?.call(Employee.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Employee?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EmployeeTable>? where,
    int? offset,
    _i1.OrderByBuilder<EmployeeTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<EmployeeTable>? orderByList,
    _i1.Transaction? transaction,
    EmployeeInclude? include,
  }) async {
    return session.db.findFirstRow<Employee>(
      where: where?.call(Employee.t),
      orderBy: orderBy?.call(Employee.t),
      orderByList: orderByList?.call(Employee.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Employee?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    EmployeeInclude? include,
  }) async {
    return session.db.findById<Employee>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Employee>> insert(
    _i1.Session session,
    List<Employee> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Employee>(
      rows,
      transaction: transaction,
    );
  }

  Future<Employee> insertRow(
    _i1.Session session,
    Employee row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Employee>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Employee>> update(
    _i1.Session session,
    List<Employee> rows, {
    _i1.ColumnSelections<EmployeeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Employee>(
      rows,
      columns: columns?.call(Employee.t),
      transaction: transaction,
    );
  }

  Future<Employee> updateRow(
    _i1.Session session,
    Employee row, {
    _i1.ColumnSelections<EmployeeTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Employee>(
      row,
      columns: columns?.call(Employee.t),
      transaction: transaction,
    );
  }

  Future<List<Employee>> delete(
    _i1.Session session,
    List<Employee> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Employee>(
      rows,
      transaction: transaction,
    );
  }

  Future<Employee> deleteRow(
    _i1.Session session,
    Employee row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Employee>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Employee>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<EmployeeTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Employee>(
      where: where(Employee.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<EmployeeTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Employee>(
      where: where?.call(Employee.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class EmployeeAttachRowRepository {
  const EmployeeAttachRowRepository._();

  Future<void> address(
    _i1.Session session,
    Employee employee,
    _i2.Address address, {
    _i1.Transaction? transaction,
  }) async {
    if (employee.id == null) {
      throw ArgumentError.notNull('employee.id');
    }
    if (address.id == null) {
      throw ArgumentError.notNull('address.id');
    }

    var $employee = employee.copyWith(addressId: address.id);
    await session.db.updateRow<Employee>(
      $employee,
      columns: [Employee.t.addressId],
      transaction: transaction,
    );
  }
}
