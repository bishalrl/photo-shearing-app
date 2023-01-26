import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:pinterest_demo/Home_screen/Home_Screen.dart';
import 'package:pinterest_demo/Random/Add.dart';
import 'package:pinterest_demo/Widgits/button.dart';
import 'package:pinterest_demo/Widgits/inputfield.dart';
import 'package:pinterest_demo/account_check/Account_check.dart';
import 'package:pinterest_demo/login/loginscreen.dart';

class Information extends StatefulWidget {
  @override
  State<Information> createState() => _InformationState();
}

class _InformationState extends State<Information> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _fullNamecontroller =
      TextEditingController(text: '');
  final TextEditingController _emailcontroller =
      TextEditingController(text: '');
  final TextEditingController _passwordcontroller =
      TextEditingController(text: '');
  final TextEditingController _phoneNumcontroller =
      TextEditingController(text: '');
  File? imageFile;
  String? imageUrl;
  void _showImageDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Please choose an option'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () {
                    _getFromcamera();
                    //get from camera
                  },
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Icon(
                          Icons.camera,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        'Camera',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    _getFromgallery();
                    //picking image from gallery
                  },
                  child: Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(
                          8,
                        ),
                        child: Icon(
                          Icons.image,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        'Gallery',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  void _getFromcamera() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    _cropImage(pickedFile!.path);
    Navigator.pop(context);
  }

  void _getFromgallery() async {
    XFile? PickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    _cropImage(PickedFile!.path);
    Navigator.pop(context);
  }

  void _cropImage(filePath) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: filePath,
      maxHeight: 1080,
      maxWidth: 1080,
    );
    if (croppedImage != null) {
      setState(() {
        imageFile = File(croppedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              _showImageDialog();
              //create show image dialogue
            },
            child: CircleAvatar(
              backgroundImage: imageFile == null
                  ? const NetworkImage(
                      'https://imgs.search.brave.com/sSUhxZErbj4ES1E0Ld6DfJ1svu5JKSFpC8nl-EuXkZ8/rs:fit:518:225:1/g:ce/aHR0cHM6Ly90c2Ux/Lm1tLmJpbmcubmV0/L3RoP2lkPU9JUC5D/aWxJZDM3NGVTRl9u/T2kwbzB0TWNRSGFH/eCZwaWQ9QXBp')
                  : Image.file(imageFile!).image,
              radius: 100,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InputField(
              hintText: 'Enter your Full Name',
              icon: Icons.person,
              obsecureText: false,
              textEditingController: _fullNamecontroller),
          InputField(
              hintText: 'Enter your Phone.No',
              icon: Icons.numbers,
              obsecureText: false,
              textEditingController: _phoneNumcontroller),
          InputField(
              hintText: 'Enter your Email',
              icon: Icons.email,
              obsecureText: false,
              textEditingController: _emailcontroller),
          InputField(
              hintText: 'Enter you password',
              icon: Icons.security,
              obsecureText: true,
              textEditingController: _passwordcontroller),
          const SizedBox(
            height: 15,
          ),
          Main_Button(
              onTap: () async {
                if (imageFile == null) {
                  Fluttertoast.showToast(msg: "Please select an image");
                  return;
                }
                try {
                  final ref = FirebaseStorage.instance
                      .ref()
                      .child('user Image')
                      .child('${DateTime.now()}.jpg');
                  await ref.putFile(imageFile!);
                  imageUrl = await ref.getDownloadURL();
                  await _auth.createUserWithEmailAndPassword(
                      email: _emailcontroller.text.trim().toLowerCase(),
                      password: _passwordcontroller.text.trim());
                  final User? user = _auth.currentUser;
                  final _uid = user!.uid;
                  FirebaseFirestore.instance.collection('users').doc(_uid).set({
                    'id': _uid,
                    'userImage': imageUrl,
                    'name': _fullNamecontroller.text,
                    'email': _emailcontroller.text,
                    'phoneNumber': _phoneNumcontroller.text,
                    'createAt': Timestamp.now(),
                  });
                  Navigator.canPop(context) ? Navigator.pop(context) : null;
                } catch (error) {
                  Fluttertoast.showToast(msg: 'something went wrong');
                }
                //home page
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Home_Page()));
              },
              colors1: Colors.red,
              colors2: Colors.redAccent,
              text: 'Create Account'),
          Account_Check(
              login: false,
              press: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              }),
        ],
      ),
    );
  }
}
