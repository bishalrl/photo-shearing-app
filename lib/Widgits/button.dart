import 'dart:ui';
import 'package:flutter/material.dart';

class Main_Button extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color colors1;
  final Color colors2;

  const Main_Button(
      {required this.onTap,
      required this.colors1,
      required this.colors2,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(top: 6.0, bottom: 6),
        child: Container(
          height: 65,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    colors1,
                    colors2,
                  ]),
              boxShadow: [
                BoxShadow(
                  offset: Offset(2, 2),
                  spreadRadius: 1,
                  blurRadius: 4,
                  color: Colors.red,
                ),
                BoxShadow(
                    offset: Offset(2, 2),
                    blurRadius: 4,
                    spreadRadius: 1,
                    color: Colors.redAccent)
              ]),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
