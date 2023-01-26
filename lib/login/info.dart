import 'package:flutter/material.dart';

import 'package:pinterest_demo/Random/Add.dart';
import 'package:pinterest_demo/Sign_up/Signup_Screen.dart';
import 'package:pinterest_demo/Widgits/button.dart';
import 'package:pinterest_demo/Widgits/inputfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pinterest_demo/account_check/Account_check.dart';
import 'package:pinterest_demo/forget_password/forget_password.dart';

class InfoUser extends StatefulWidget {
  @override
  State<InfoUser> createState() => _InfoUserState();
}

class _InfoUserState extends State<InfoUser> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final TextEditingController _emailtextcontroller =
      TextEditingController(text: '');

  final TextEditingController _passwordtextcontroller =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: CircleAvatar(
              backgroundImage: const NetworkImage(
                  'https://imgs.search.brave.com/j8Qq2o5af8NJJRiCgqkAKS8OL0Hh0hSkxWosxTNyAyY/rs:fit:474:225:1/g:ce/aHR0cHM6Ly90c2Uy/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5P/N2pDRmJjZ0c0aXlO/dWdaa0VlZWRRSGFI/YSZwaWQ9QXBp'),
              radius: 100,
              backgroundColor: Colors.orange.shade800,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          InputField(
              hintText: 'Enter Email',
              icon: Icons.email,
              obsecureText: false,
              textEditingController: _emailtextcontroller),
          const SizedBox(
            height: 15,
          ),
          InputField(
              hintText: 'Enter Password',
              icon: Icons.password,
              obsecureText: true,
              textEditingController: _passwordtextcontroller),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Forget_Password()));
                },
                child: const Text(
                  "Forget Password",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Main_Button(
              onTap: () async {
                try {
                  await _auth.signInWithEmailAndPassword(
                      email: _emailtextcontroller.text.trim(),
                      password: _passwordtextcontroller.text.trim());
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Home_Page()));
                } catch (e) {
                  Fluttertoast.showToast(msg: Error.safeToString('error'));
                }
              },
              colors1: Colors.red,
              colors2: Colors.redAccent,
              text: 'LogIn'),
          Account_Check(
            login: true,
            press: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Signup_Screen()));
            },
            //signup screen
          ),
        ],
      ),
    );
  }
}
