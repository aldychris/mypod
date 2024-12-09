import 'package:serverpod/serverpod.dart';

import '../generated/employee.dart';

class EmployeeEndpoint extends Endpoint {
  @override
  bool get requireLogin => true;

  Future<Employee> addEmployee(Session session, String name) async {
    final employee = Employee(name: name, addressId: 1);
    return await Employee.db.insertRow(session, employee);
  }

  Future<List<Employee>> getEmployee(Session session) async {
    return await Employee.db.find(session);
  }
}
