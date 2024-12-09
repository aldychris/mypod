import 'package:flutter/material.dart';
import 'package:mypod_flutter/main.dart';

class EmployeePage extends StatefulWidget {
  const EmployeePage({super.key});

  @override
  EmployeePageState createState() => EmployeePageState();
}

class EmployeePageState extends State<EmployeePage> {
  final _employeeNameController = TextEditingController();
  dynamic result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _employeeNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Employee Name',
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    client.employee
                        .addEmployee(_employeeNameController.text)
                        .then((apiResult) {
                      setState(() {
                        result = apiResult.toString();
                      });
                    });
                  },
                  child: const Text('Add Employee'),
                ),
                ElevatedButton(
                  onPressed: () {
                    client.employee.getEmployee().then((apiResult) {
                      setState(() {
                        result = apiResult.toString();
                      });
                    });
                  },
                  child: const Text('Get Employee'),
                ),
              ],
            ),
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.grey,
              margin: const EdgeInsets.only(top: 16),
              child: Text(result),
            ),
          ],
        ),
      ),
    );
  }
}
