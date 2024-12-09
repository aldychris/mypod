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
import 'employee.dart' as _i2;

abstract class Company implements _i1.TableRow, _i1.ProtocolSerialization {
  Company._({
    this.id,
    required this.name,
    this.employees,
  });

  factory Company({
    int? id,
    required String name,
    List<_i2.Employee>? employees,
  }) = _CompanyImpl;

  factory Company.fromJson(Map<String, dynamic> jsonSerialization) {
    return Company(
      id: jsonSerialization['id'] as int?,
      name: jsonSerialization['name'] as String,
      employees: (jsonSerialization['employees'] as List?)
          ?.map((e) => _i2.Employee.fromJson((e as Map<String, dynamic>)))
          .toList(),
    );
  }

  static final t = CompanyTable();

  static const db = CompanyRepository._();

  @override
  int? id;

  String name;

  List<_i2.Employee>? employees;

  @override
  _i1.Table get table => t;

  Company copyWith({
    int? id,
    String? name,
    List<_i2.Employee>? employees,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (employees != null)
        'employees': employees?.toJson(valueToJson: (v) => v.toJson()),
    };
  }

  @override
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'name': name,
      if (employees != null)
        'employees':
            employees?.toJson(valueToJson: (v) => v.toJsonForProtocol()),
    };
  }

  static CompanyInclude include({_i2.EmployeeIncludeList? employees}) {
    return CompanyInclude._(employees: employees);
  }

  static CompanyIncludeList includeList({
    _i1.WhereExpressionBuilder<CompanyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CompanyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CompanyTable>? orderByList,
    CompanyInclude? include,
  }) {
    return CompanyIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(Company.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(Company.t),
      include: include,
    );
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _CompanyImpl extends Company {
  _CompanyImpl({
    int? id,
    required String name,
    List<_i2.Employee>? employees,
  }) : super._(
          id: id,
          name: name,
          employees: employees,
        );

  @override
  Company copyWith({
    Object? id = _Undefined,
    String? name,
    Object? employees = _Undefined,
  }) {
    return Company(
      id: id is int? ? id : this.id,
      name: name ?? this.name,
      employees: employees is List<_i2.Employee>?
          ? employees
          : this.employees?.map((e0) => e0.copyWith()).toList(),
    );
  }
}

class CompanyTable extends _i1.Table {
  CompanyTable({super.tableRelation}) : super(tableName: 'company') {
    name = _i1.ColumnString(
      'name',
      this,
    );
  }

  late final _i1.ColumnString name;

  _i2.EmployeeTable? ___employees;

  _i1.ManyRelation<_i2.EmployeeTable>? _employees;

  _i2.EmployeeTable get __employees {
    if (___employees != null) return ___employees!;
    ___employees = _i1.createRelationTable(
      relationFieldName: '__employees',
      field: Company.t.id,
      foreignField: _i2.Employee.t.$_companyEmployeesCompanyId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.EmployeeTable(tableRelation: foreignTableRelation),
    );
    return ___employees!;
  }

  _i1.ManyRelation<_i2.EmployeeTable> get employees {
    if (_employees != null) return _employees!;
    var relationTable = _i1.createRelationTable(
      relationFieldName: 'employees',
      field: Company.t.id,
      foreignField: _i2.Employee.t.$_companyEmployeesCompanyId,
      tableRelation: tableRelation,
      createTable: (foreignTableRelation) =>
          _i2.EmployeeTable(tableRelation: foreignTableRelation),
    );
    _employees = _i1.ManyRelation<_i2.EmployeeTable>(
      tableWithRelations: relationTable,
      table: _i2.EmployeeTable(
          tableRelation: relationTable.tableRelation!.lastRelation),
    );
    return _employees!;
  }

  @override
  List<_i1.Column> get columns => [
        id,
        name,
      ];

  @override
  _i1.Table? getRelationTable(String relationField) {
    if (relationField == 'employees') {
      return __employees;
    }
    return null;
  }
}

class CompanyInclude extends _i1.IncludeObject {
  CompanyInclude._({_i2.EmployeeIncludeList? employees}) {
    _employees = employees;
  }

  _i2.EmployeeIncludeList? _employees;

  @override
  Map<String, _i1.Include?> get includes => {'employees': _employees};

  @override
  _i1.Table get table => Company.t;
}

class CompanyIncludeList extends _i1.IncludeList {
  CompanyIncludeList._({
    _i1.WhereExpressionBuilder<CompanyTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(Company.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table get table => Company.t;
}

class CompanyRepository {
  const CompanyRepository._();

  final attach = const CompanyAttachRepository._();

  final attachRow = const CompanyAttachRowRepository._();

  final detach = const CompanyDetachRepository._();

  final detachRow = const CompanyDetachRowRepository._();

  Future<List<Company>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CompanyTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<CompanyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CompanyTable>? orderByList,
    _i1.Transaction? transaction,
    CompanyInclude? include,
  }) async {
    return session.db.find<Company>(
      where: where?.call(Company.t),
      orderBy: orderBy?.call(Company.t),
      orderByList: orderByList?.call(Company.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Company?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CompanyTable>? where,
    int? offset,
    _i1.OrderByBuilder<CompanyTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<CompanyTable>? orderByList,
    _i1.Transaction? transaction,
    CompanyInclude? include,
  }) async {
    return session.db.findFirstRow<Company>(
      where: where?.call(Company.t),
      orderBy: orderBy?.call(Company.t),
      orderByList: orderByList?.call(Company.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
      include: include,
    );
  }

  Future<Company?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
    CompanyInclude? include,
  }) async {
    return session.db.findById<Company>(
      id,
      transaction: transaction,
      include: include,
    );
  }

  Future<List<Company>> insert(
    _i1.Session session,
    List<Company> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<Company>(
      rows,
      transaction: transaction,
    );
  }

  Future<Company> insertRow(
    _i1.Session session,
    Company row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<Company>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Company>> update(
    _i1.Session session,
    List<Company> rows, {
    _i1.ColumnSelections<CompanyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<Company>(
      rows,
      columns: columns?.call(Company.t),
      transaction: transaction,
    );
  }

  Future<Company> updateRow(
    _i1.Session session,
    Company row, {
    _i1.ColumnSelections<CompanyTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<Company>(
      row,
      columns: columns?.call(Company.t),
      transaction: transaction,
    );
  }

  Future<List<Company>> delete(
    _i1.Session session,
    List<Company> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<Company>(
      rows,
      transaction: transaction,
    );
  }

  Future<Company> deleteRow(
    _i1.Session session,
    Company row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<Company>(
      row,
      transaction: transaction,
    );
  }

  Future<List<Company>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<CompanyTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<Company>(
      where: where(Company.t),
      transaction: transaction,
    );
  }

  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<CompanyTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<Company>(
      where: where?.call(Company.t),
      limit: limit,
      transaction: transaction,
    );
  }
}

class CompanyAttachRepository {
  const CompanyAttachRepository._();

  Future<void> employees(
    _i1.Session session,
    Company company,
    List<_i2.Employee> employee, {
    _i1.Transaction? transaction,
  }) async {
    if (employee.any((e) => e.id == null)) {
      throw ArgumentError.notNull('employee.id');
    }
    if (company.id == null) {
      throw ArgumentError.notNull('company.id');
    }

    var $employee = employee
        .map((e) => _i2.EmployeeImplicit(
              e,
              $_companyEmployeesCompanyId: company.id,
            ))
        .toList();
    await session.db.update<_i2.Employee>(
      $employee,
      columns: [_i2.Employee.t.$_companyEmployeesCompanyId],
      transaction: transaction,
    );
  }
}

class CompanyAttachRowRepository {
  const CompanyAttachRowRepository._();

  Future<void> employees(
    _i1.Session session,
    Company company,
    _i2.Employee employee, {
    _i1.Transaction? transaction,
  }) async {
    if (employee.id == null) {
      throw ArgumentError.notNull('employee.id');
    }
    if (company.id == null) {
      throw ArgumentError.notNull('company.id');
    }

    var $employee = _i2.EmployeeImplicit(
      employee,
      $_companyEmployeesCompanyId: company.id,
    );
    await session.db.updateRow<_i2.Employee>(
      $employee,
      columns: [_i2.Employee.t.$_companyEmployeesCompanyId],
      transaction: transaction,
    );
  }
}

class CompanyDetachRepository {
  const CompanyDetachRepository._();

  Future<void> employees(
    _i1.Session session,
    List<_i2.Employee> employee, {
    _i1.Transaction? transaction,
  }) async {
    if (employee.any((e) => e.id == null)) {
      throw ArgumentError.notNull('employee.id');
    }

    var $employee = employee
        .map((e) => _i2.EmployeeImplicit(
              e,
              $_companyEmployeesCompanyId: null,
            ))
        .toList();
    await session.db.update<_i2.Employee>(
      $employee,
      columns: [_i2.Employee.t.$_companyEmployeesCompanyId],
      transaction: transaction,
    );
  }
}

class CompanyDetachRowRepository {
  const CompanyDetachRowRepository._();

  Future<void> employees(
    _i1.Session session,
    _i2.Employee employee, {
    _i1.Transaction? transaction,
  }) async {
    if (employee.id == null) {
      throw ArgumentError.notNull('employee.id');
    }

    var $employee = _i2.EmployeeImplicit(
      employee,
      $_companyEmployeesCompanyId: null,
    );
    await session.db.updateRow<_i2.Employee>(
      $employee,
      columns: [_i2.Employee.t.$_companyEmployeesCompanyId],
      transaction: transaction,
    );
  }
}
