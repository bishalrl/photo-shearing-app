import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pinterest_demo/Home_screen/Home_Screen.dart';
import 'package:pinterest_demo/Random/Add.dart';
import 'package:pinterest_demo/login/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(PinTerest());
}

class PinTerest extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              home: Scaffold(body: Text('Welcome to photo shearing App')),
            );
          } else if (snapshot.hasError) {
            return const MaterialApp(
              home: Scaffold(body: Text('Error on photo shearing App')),
            );
          }
          return Material(
            child: MaterialApp(
              home
                  // : FirebaseAuth.instance.currentUser == null
                  //     ? LoginScreen()
                  : LoginScreen(),
            ),
          );
        });
  }
}
