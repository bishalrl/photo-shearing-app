import 'package:flutter/material.dart';
import 'package:pinterest_demo/Widgits/TextField.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obsecureText;
  final TextEditingController textEditingController;
  InputField(
      {required this.hintText,
      required this.icon,
      required this.obsecureText,
      required this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        cursorColor: Colors.white,
        obscureText: obsecureText,
        controller: textEditingController,
        decoration: InputDecoration(
            hintText: hintText,
            helperStyle: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
            prefixIcon: Icon(
              icon,
              size: 25,
              color: Colors.white,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
