import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class Civil extends StatefulWidget {
  const Civil({Key? key}) : super(key: key);

  @override
  State<Civil> createState() => _CivilState();
}

class _CivilState extends State<Civil> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Civil Engineering"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 154, 139, 197),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: const Center(
                  child: Text(
                    "first semester",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 153, 240, 156),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Civil())));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 154, 139, 197),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: const Center(
                  child: Text(
                    "Second semestar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 153, 240, 156),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Civil())));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 154, 139, 197),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: const Center(
                  child: Text(
                    "Third semestar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 153, 240, 156),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Civil())));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 154, 139, 197),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: const Center(
                  child: Text(
                    "Fourth semestar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 153, 240, 156),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Civil())));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 154, 139, 197),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: const Center(
                  child: Text(
                    "Fifth semestar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 153, 240, 156),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Civil())));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 154, 139, 197),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: const Center(
                  child: Text(
                    "Sixth semestar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 153, 240, 156),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Civil())));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 154, 139, 197),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: const Center(
                  child: Text(
                    "Seventh semestar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 153, 240, 156),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Civil())));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: InkWell(
              child: Container(
                height: 80,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 154, 139, 197),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: const Center(
                  child: Text(
                    "Eight semestar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 153, 240, 156),
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => Civil())));
              },
            ),
          ),
        ],
      ),
    ));
  }
}
