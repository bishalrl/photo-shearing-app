import 'package:flutter/material.dart';
import 'package:pinterest_demo/Sign_up/headtext.dart';
import 'package:pinterest_demo/Sign_up/info.dart';

class Signup_Screen extends StatelessWidget {
  const Signup_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.pink, Colors.deepOrange.shade300],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: const [0.2, 0.9])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: SingleChildScrollView(
          child: Column(
            children: [
              HeadText(),
              Information(),
            ],
          ),
        )),
      ),
    );
  }
}
