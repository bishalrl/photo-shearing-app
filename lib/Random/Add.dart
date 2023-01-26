// import 'dart:io';
// import 'dart:math';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';

// class Add_View extends StatefulWidget {
//   const Add_View({Key? key}) : super(key: key);

//   @override
//   State<Add_View> createState() => _Add_ViewState();
// }

// class _Add_ViewState extends State<Add_View> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         title: Text('PDF to add and show'),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           uploadDataToFirebase();
//         },
//         child: Icon(
//           Icons.add,
//           color: Colors.black,
//         ),
//         backgroundColor: Colors.white,
//       ),
//       body: StreamBuilder(
//           stream: FirebaseFirestore.instance.collection("file").snapshots(),
//           builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.hasData) {
//               return ListView.builder(
//                   itemCount: snapshot.data!.docs.length,
//                   itemBuilder: (context, index) {
//                     QueryDocumentSnapshot x = snapshot.data!.docs[index];
//                     return Container(
//                       margin: EdgeInsets.symmetric(vertical: 10),
//                       child: Text(x["fileUrl"]),
//                     );
//                   });
//             }
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }),
//     );
//   }

//   String url = "";
//   int? number;

//   uploadDataToFirebase() async {
//     //generate random number
//     number = Random().nextInt(10);
//     //pick pdf file
//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//     File pick = File(result!.files.single.path.toString());
//     var file = pick.readAsBytesSync();
//     String name = DateTime.now().millisecondsSinceEpoch.toString();
//     //uploading file to firebase
//     var pdfFile = FirebaseStorage.instance.ref().child(name).child("/.pdf");

//     UploadTask task = pdfFile.putData(file);
//     TaskSnapshot snapshot = await task;
//     url = await snapshot.ref.getDownloadURL();
//     //upload url to cloud firebase
//     await FirebaseFirestore.instance
//         .collection("file")
//         .doc()
//         .set({'fileUrl': url, 'num': "Book#" + number.toString()});
//   }
// }
import 'dart:io';
import 'dart:typed_data';

import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:pinterest_demo/login/loginscreen.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('PDF to add and show'),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            //
            //logout button
            FirebaseAuth.instance.signOut();
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: Icon(Icons.login_outlined),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          uploadDataToFirebase();
        },
        child: Icon(
          Icons.add,
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("file").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    QueryDocumentSnapshot x = snapshot.data!.docs[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => View(
                                      Url: x[''],
                                    )));
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                        child: Text(
                          x["num"],
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    );
                  });
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }

  String url = "";
  int? number;

  uploadDataToFirebase() async {
    //generate random number
    number = Random().nextInt(10);
    //pick pdf file
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    File pick = File(result!.files.single.path.toString());
    var file = pick.readAsBytesSync();
    String name = DateTime.now().millisecondsSinceEpoch.toString();
    //uploading file to firebase
    var pdfFile = FirebaseStorage.instance.ref().child(name).child("/.pdf");

    UploadTask task = pdfFile.putData(file);
    TaskSnapshot snapshot = await task;
    url = await snapshot.ref.getDownloadURL();
    //upload url to cloud firebase
    await FirebaseFirestore.instance
        .collection("file")
        .doc()
        .set({'fileUrl': url, 'num': "Book#" + number.toString()});
  }
}

class View extends StatelessWidget {
  final Url;
  View({this.Url});
  PdfViewerController? _pdfViewerController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pdf View"),
      ),
      body: SfPdfViewer.network(
        Url,
        controller: _pdfViewerController,
      ),
    );
  }
}
