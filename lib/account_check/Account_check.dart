import 'dart:ffi';

import 'package:flutter/material.dart';

class Account_check extends StatelessWidget {
  final bool login;
  final VoidCallback press;
  Account_check({required this.login, required this.press});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an account" : "Alredy have an account",
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Create Account" : "Log in",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
        SizedBox(
          height: 40,
        )
      ],
    );
  }
}
