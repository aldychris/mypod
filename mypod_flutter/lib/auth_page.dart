import 'package:flutter/material.dart';
import 'package:mypod_flutter/main.dart';
import 'package:serverpod_auth_email_flutter/serverpod_auth_email_flutter.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  late Future<void> _authStatusFuture;

  bool isLoggedIn = false;
  String loggedInStatus = '';

  @override
  void initState() {
    super.initState();
    _authStatusFuture = _checkAuthStatus();
  }

  Future<void> _checkAuthStatus() async {
    bool isSignedIn = await client.modules.auth.status.isSignedIn();
    if (isSignedIn) {
      var userInfo = await client.modules.auth.status.getUserInfo();
      setState(() {
        if (userInfo != null) {
          loggedInStatus = 'Signed in with ${userInfo.email ?? ''}';
        } else {
          loggedInStatus = 'Signed in';
        }
        isLoggedIn = true;
      });
    } else {
      setState(() {
        loggedInStatus = 'Not signed in';
        isLoggedIn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Sample'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<void>(
          future: _authStatusFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(loggedInStatus),
                  ),
                  if (isLoggedIn)
                    ElevatedButton(
                      onPressed: () {
                        client.modules.auth.status
                            .signOutAllDevices()
                            .then((value) {
                          setState(() {
                            loggedInStatus = 'Signed out';
                            isLoggedIn = false;
                          });
                        });
                      },
                      child: const Text('Sign out'),
                    ),
                  if (!isLoggedIn)
                    SignInWithEmailButton(
                      caller: client.modules.auth,
                      onSignedIn: () {
                        _authStatusFuture = _checkAuthStatus();
                        setState(() {});
                      },
                    ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
