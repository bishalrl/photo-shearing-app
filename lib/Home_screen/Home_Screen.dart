// import 'dart:io';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:pinterest_demo/login/loginscreen.dart';

// class Home_Screen extends StatefulWidget {
//   const Home_Screen({Key? key}) : super(key: key);

//   @override
//   State<Home_Screen> createState() => _Home_ScreenState();
// }

// class _Home_ScreenState extends State<Home_Screen> {
//   String ChangeTitle = 'Grid View';
//   bool checkView = false;

//   File? imageFile;

//   String? imageUrl;
//   String? myImage;
//   String? myName;
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   void _showImageDialog() {
//     showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: const Text('Please choose an option'),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     _getFromcamera();
//                     //get from camera
//                   },
//                   child: Row(
//                     children: const [
//                       Padding(
//                         padding: EdgeInsets.all(4),
//                         child: Icon(
//                           Icons.camera,
//                           color: Colors.red,
//                         ),
//                       ),
//                       Text(
//                         'Camera',
//                         style: TextStyle(color: Colors.red),
//                       )
//                     ],
//                   ),
//                 ),
//                 InkWell(
//                   onTap: () {
//                     _getFromgallery();
//                     //picking image from gallery
//                   },
//                   child: Row(
//                     children: const [
//                       Padding(
//                         padding: EdgeInsets.all(
//                           8,
//                         ),
//                         child: Icon(
//                           Icons.image,
//                           color: Colors.red,
//                         ),
//                       ),
//                       Text(
//                         'Gallery',
//                         style: TextStyle(color: Colors.red),
//                       )
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           );
//         });
//   }

//   void _getFromcamera() async {
//     XFile? pickedFile =
//         await ImagePicker().pickImage(source: ImageSource.camera);
//     _cropImage(pickedFile!.path);
//     Navigator.pop(context);
//   }

//   void _getFromgallery() async {
//     XFile? PickedFile =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     _cropImage(PickedFile!.path);
//     Navigator.pop(context);
//   }

//   void _cropImage(filePath) async {
//     CroppedFile? croppedImage = await ImageCropper().cropImage(
//       sourcePath: filePath,
//       maxHeight: 1080,
//       maxWidth: 1080,
//     );
//     if (croppedImage != null) {
//       setState(() {
//         imageFile = File(croppedImage.path);
//       });
//     }
//   }

//   void _upload_image() async {
//     if (imageFile == null) {
//       Fluttertoast.showToast(msg: "Please select an image");
//       return;
//     }
//     try {
//       final ref = FirebaseStorage.instance
//           .ref()
//           .child('user Images')
//           .child('${DateTime.now()}jpg');
//       //DateTime.now().toString() + 'jpg'
//       await ref.putFile(imageFile!);
//       imageUrl = await ref.getDownloadURL();
//       FirebaseFirestore.instance
//           .collection('wallpaper')
//           .doc(DateTime.now().toString())
//           .set({
//         'id': _auth.currentUser!.uid,
//         'userImage': myImage,
//         'name': myName,
//         'email': _auth.currentUser!.email,
//         'image': imageUrl,
//         'download': 0,
//         'createdAt': DateTime.now(),
//       });
//       Navigator.canPop(context) ? Navigator.pop(context) : null;
//       imageFile = null;
//     } catch (error) {
//       Fluttertoast.showToast(msg: "error");
//     }
//   }

//   void read_userInfo() async {
//     FirebaseFirestore.instance
//         .collection('users')
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .get()
//         .then<dynamic>((DocumentSnapshot snapshot) async {
//       myImage = snapshot.get('userImage');
//       myName = snapshot.get('name');
//     });
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     read_userInfo();
//   }

//   Widget ListVieWidget(String docId, String img, String userImg, String name,
//       DateTime date, String userId, int downloads) {
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: Card(
//         elevation: 16,
//         shadowColor: Colors.white,
//         child: Container(
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//                   colors: [Colors.deepOrange.shade300, Colors.pink],
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight,
//                   stops: const [0.2, 0.9])),
//           padding: const EdgeInsets.all(5),
//           child: Column(
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   //create owner details
//                 },
//                 child: Image.network(
//                   'img',
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               const SizedBox(
//                 height: 15,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 8,
//                   right: 8,
//                   bottom: 8,
//                 ),
//                 child: Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 50,
//                       backgroundImage: NetworkImage(
//                         userImg,
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           name,
//                           style: const TextStyle(
//                               color: Colors.white, fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget gridVieWidget(String docId, String img, String userImg, String name,
//       DateTime date, String userId, int downloads) {
//     return GridView.count(
//       crossAxisCount: 1,
//       primary: false,
//       padding: EdgeInsets.all(7),
//       crossAxisSpacing: 1,
//       children: [
//         Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [Colors.deepOrange.shade300, Colors.pink],
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//               stops: const [0.2, 0.9],
//             ),
//           ),
//           padding: EdgeInsets.all(10),
//           child: GestureDetector(
//             onTap: () {
//               //create owener details
//             },
//             child: Center(
//               child: Image.network(
//                 img,
//                 fit: BoxFit.fill,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           gradient: LinearGradient(
//               colors: [Colors.pink, Colors.deepOrange.shade300],
//               begin: Alignment.centerLeft,
//               end: Alignment.centerRight,
//               stops: const [0.2, 0.9])),
//       child: Scaffold(
//         appBar: AppBar(
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                     colors: [Colors.deepOrange.shade300, Colors.pink],
//                     begin: Alignment.centerLeft,
//                     end: Alignment.centerRight,
//                     stops: const [0.2, 0.9])),
//           ),
//           title: GestureDetector(
//             onTap: () {
//               setState(() {
//                 ChangeTitle = 'List View';
//                 checkView = true;
//               });
//             },
//             onDoubleTap: () {
//               setState(() {
//                 ChangeTitle = 'Grid View';
//                 checkView = false;
//               });
//             },
//             child: Text(ChangeTitle),
//           ),
//           centerTitle: true,
//           leading: GestureDetector(
//             onTap: () {
//               //
//               //logout button
//               FirebaseAuth.instance.signOut();
//               Navigator.pushReplacement(context,
//                   MaterialPageRoute(builder: (context) => LoginScreen()));
//             },
//             child: Icon(Icons.login_outlined),
//           ),
//         ),
//         floatingActionButton: Wrap(
//           direction: Axis.horizontal,
//           children: [
//             Container(
//               margin: const EdgeInsets.all(10),
//               child: FloatingActionButton(
//                 onPressed: () {
//                   _showImageDialog();

//                   ////function for show image dialog
//                 },
//                 backgroundColor: Colors.deepOrange.shade400,
//                 child: const Icon(Icons.camera),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.all(10),
//               child: FloatingActionButton(
//                 heroTag: Null,
//                 onPressed: () {
//                   _upload_image();
//                   //upload image
//                 },
//                 backgroundColor: Colors.pink.shade400,
//                 child: const Icon(Icons.cloud_upload),
//               ),
//             )
//           ],
//         ),
//         backgroundColor: Colors.transparent,
//         body: StreamBuilder<QuerySnapshot>(
//           stream: FirebaseFirestore.instance
//               .collection("wallpaper")
//               .orderBy("createdAt", descending: true)
//               .snapshots(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             } else if (snapshot.connectionState == ConnectionState.active) {
//               if (snapshot.data!.docs.isEmpty) {
//                 if (checkView = true) {
//                   return ListView.builder(
//                     itemBuilder: ((BuildContext context, int index) {
//                       return ListVieWidget(
//                           snapshot.data!.docs[index].id,
//                           snapshot.data!.docs[index]['image'],
//                           snapshot.data!.docs[index]['userImage'],
//                           snapshot.data!.docs[index]['name'],
//                           snapshot.data!.docs[index]['createdAt'].toDate(),
//                           snapshot.data!.docs[index]['id'],
//                           snapshot.data!.docs[index]['download']);
//                     }),
//                     itemCount: snapshot.data!.docs.length,
//                   );
//                 } else {
//                   return GridView.builder(
//                     itemCount: snapshot.data!.docs.length,
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 3,
//                     ),
//                     itemBuilder: ((BuildContext context, int index) {
//                       return ListVieWidget(
//                           snapshot.data!.docs[index].id,
//                           snapshot.data!.docs[index]['image'],
//                           snapshot.data!.docs[index]['userImage'],
//                           snapshot.data!.docs[index]['name'],
//                           snapshot.data!.docs[index]['createdAt'].toDate(),
//                           snapshot.data!.docs[index]['id'],
//                           snapshot.data!.docs[index]['download']);
//                     }),
//                   );
//                 }
//               } else {
//                 return const Center(
//                   child: Text('There is no task',
//                       style:
//                           TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
//                 );
//               }
//             }
//             return const Center(
//               child: Text(
//                 'Something went wrong',
//                 style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// // }
// import 'package:flutter/material.dart';
// import 'package:pinterest_demo/Random/Add.dart';

// import 'package:pinterest_demo/Random/civil/civil.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           flexibleSpace: Container(
//             decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                     colors: [Colors.deepOrange.shade300, Colors.pink],
//                     begin: Alignment.centerLeft,
//                     end: Alignment.centerRight,
//                     stops: const [0.2, 0.9])),
//           ),
//           title: GestureDetector(onTap: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => Add_View()));
//           }, onDoubleTap: () {
//             Navigator.push(
//                 context, MaterialPageRoute(builder: (context) => HomePage()));
//           }),
//         ),
//         body: ListView(
//           children: [
//             Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: (Container(
//                   height: 250,
//                   decoration: const BoxDecoration(
//                     color: Color.fromARGB(255, 174, 154, 227),
//                     borderRadius: BorderRadius.all(Radius.circular(15)),
//                   ),
//                   child: Row(
//                     children: [
//                       SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children: [],
//                         ),
//                       )
//                     ],
//                   ),
//                 ))),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: InkWell(
//                 child: Container(
//                   height: 80,
//                   decoration: const BoxDecoration(
//                     color: Color.fromARGB(255, 154, 139, 197),
//                     borderRadius: BorderRadius.all(Radius.circular(15)),
//                   ),
//                   child: const Center(
//                     child: Text(
//                       "Civil Engineering",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                         color: Color.fromARGB(255, 153, 240, 156),
//                       ),
//                     ),
//                   ),
//                 ),
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: ((context) => Civil())));
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: InkWell(
//                 child: Container(
//                   height: 80,
//                   decoration: const BoxDecoration(
//                     color: Color.fromARGB(255, 154, 139, 197),
//                     borderRadius: BorderRadius.all(Radius.circular(15)),
//                   ),
//                   child: const Center(
//                     child: Text(
//                       "Electrical Engineering",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                         color: Color.fromARGB(255, 153, 240, 156),
//                       ),
//                     ),
//                   ),
//                 ),
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: ((context) => Civil())));
//                 },
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: Container(
//                 height: 80,
//                 decoration: const BoxDecoration(
//                   color: Color.fromARGB(255, 154, 139, 197),
//                   borderRadius: BorderRadius.all(Radius.circular(15)),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: InkWell(
//                 child: Container(
//                   height: 80,
//                   decoration: const BoxDecoration(
//                     color: Color.fromARGB(255, 154, 139, 197),
//                     borderRadius: BorderRadius.all(Radius.circular(15)),
//                   ),
//                   child: const Center(
//                     child: Text(
//                       "Computer Engineering",
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                         color: Color.fromARGB(255, 153, 240, 156),
//                       ),
//                     ),
//                   ),
//                 ),
//                 onTap: () {
//                   Navigator.push(context,
//                       MaterialPageRoute(builder: ((context) => Civil())));
//                 },
//               ),
//             ),
//           ],
//         ));
//   }
// }
