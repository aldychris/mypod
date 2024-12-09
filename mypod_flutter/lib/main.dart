import 'package:flutter/material.dart';
import 'package:mypod_client/mypod_client.dart';
import 'package:mypod_flutter/address_page.dart';
import 'package:mypod_flutter/address_page_with_stream.dart';
import 'package:mypod_flutter/auth_page.dart';
import 'package:mypod_flutter/company_page.dart';
import 'package:mypod_flutter/employee_page.dart';
import 'package:mypod_flutter/hello_page.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

late SessionManager sessionManager;
late Client client;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const ipAddress = 'localhost';
  client = Client(
    'http://$ipAddress:8080/',
    authenticationKeyManager: FlutterAuthenticationKeyManager(),
  )..connectivityMonitor = FlutterConnectivityMonitor();

  sessionManager = SessionManager(
    caller: client.modules.auth,
  );
  await sessionManager.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Serverpod Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildElevatedButton(
                'Auth Page',
                'This page demonstrates how to authenticate a user.',
                const AuthPage(),
              ),
              _buildElevatedButton(
                'Hello Page',
                'This page demonstrates how to call a simple method on the server.',
                const HelloPage(),
              ),
              _buildElevatedButton(
                'Company Page',
                'This page demonstrates how to call a method for CRUD operations.',
                const CompanyPage(),
              ),
              _buildElevatedButton(
                'Address Page 1',
                'This page demonstrates how to edit data with WebSocket.',
                const AddressPage(),
              ),
              _buildElevatedButton(
                'Address Page 2',
                'This page demonstrates how to edit data with Stream.',
                const AddressPageWithStream(),
              ),
              _buildElevatedButton(
                'Employee Page',
                '-',
                const EmployeePage(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildElevatedButton(
    String title,
    String description,
    Widget page,
  ) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: Colors.blue,
          ),
          color: Colors.transparent,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(description),
            const Align(
                alignment: Alignment.centerRight,
                child: Icon(Icons.chevron_right)),
          ],
        ),
      ),
    );
  }
}
