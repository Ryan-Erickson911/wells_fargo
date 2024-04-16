import 'package:flutter/material.dart';

class DocsPage extends StatelessWidget {
  DocsPage({super.key});
  final GlobalKey<ScaffoldState> docsKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr, 
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: const Color.fromARGB(255, 123, 212, 247), 
          scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Image(
              image: AssetImage('assets/images/smallslogan.png'), // profile pic needs to be replaced with company logo 
              fit: BoxFit.cover
            ),
            backgroundColor: const Color.fromARGB(255, 123, 212, 247),
            automaticallyImplyLeading: false,
            shape: const Border(
              bottom: BorderSide(
                color: Colors.black,
                width: 0.5,
              ),
            ),
          ),
          body: ListView.builder(
            itemCount: 10, 
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)), // Add black border
                ),
                child: TextField(
                  style: const TextStyle(
                    fontWeight: FontWeight.bold, // Set text to bold
                    color: Colors.black, // Set text color to black
                  ),
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Notification/Info for User Document - ${index + 1}',
                    fillColor: const Color.fromARGB(255, 123, 212, 247), // Replace with your TextField color from home.dart
                    filled: true,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}