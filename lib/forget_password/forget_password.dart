import 'package:flutter/material.dart';
import 'package:pinterest_demo/forget_password/Components.dart';
import 'package:pinterest_demo/forget_password/Head_text.dart';

class Forget_Password extends StatelessWidget {
  const Forget_Password({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        Colors.pink,
        Colors.deepOrange.shade300,
      ], stops: [
        0.2,
        0.9
      ], begin: Alignment.centerLeft, end: Alignment.centerRight)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Head_Text(),
              Forget_Components(),
              //headtext
              //crediential
            ],
          ),
        ),
      ),
    );
  }
}
