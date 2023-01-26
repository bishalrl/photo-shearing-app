import 'package:flutter/material.dart';
import 'package:pinterest_demo/login/components.dart';
import 'package:pinterest_demo/login/info.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.pink, Colors.orange],
              begin: Alignment.center,
              end: Alignment.centerRight,
              stops: [0.1, 0.9])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [const HeadText(), InfoUser()],
          ),
        ),
      ),
    );
  }
}
