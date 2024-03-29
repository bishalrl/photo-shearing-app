import 'package:flutter/material.dart';

class HeadText extends StatelessWidget {
  const HeadText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.05,
          ),
          const Center(
            child: Text(
              'Pdf Sharing',
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: size.height * 0.02,
          ),
          const Center(
            child: Text(
              'Login',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
