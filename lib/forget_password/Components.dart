import 'package:flutter/material.dart';
import 'package:pinterest_demo/Sign_up/Signup_Screen.dart';
import 'package:pinterest_demo/Widgits/button.dart';
import 'package:pinterest_demo/Widgits/inputfield.dart';
import 'package:pinterest_demo/account_check/Account_check.dart';
import 'package:pinterest_demo/login/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Forget_Components extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailtextcontroller =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Center(
                child: Image.network(
                    'https://imgs.search.brave.com/6FRbuH--gFuDsYG6Re-HI9N3P2NucMENVIUWw8r3Jlc/rs:fit:416:225:1/g:ce/aHR0cHM6Ly90c2Uz/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5l/bTlOcUNuVmQydGhL/VEhZOVlqUlJnQUFB/QSZwaWQ9QXBp')),
          ),
          SizedBox(
            height: 15,
          ),
          InputField(
            hintText: 'Enter your Email',
            icon: Icons.email_rounded,
            obsecureText: false,
            textEditingController: _emailtextcontroller,
          ),
          SizedBox(
            height: 15,
          ),
          Main_Button(
              onTap: () async {
                try {
                  await _auth.sendPasswordResetEmail(
                      email: _emailtextcontroller.text);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.amber,
                    content: Text(
                      "password reset link has been sent",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ));
                } catch (error) {
                  Fluttertoast.showToast(msg: 'Error occured on sending link');
                }
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
                //press event for reset
              },
              colors1: Colors.red,
              colors2: Colors.redAccent,
              text: 'Send Link'),
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Signup_Screen()));
              },
              child: Text(
                'SignUp Screen',
                style: TextStyle(fontSize: 20),
              )),
          SizedBox(
            height: 20,
          ),
          Account_Check(
              login: false,
              press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              })
        ],
      ),
    );
  }
}
