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
          primaryColor: Colors.blue, 
            scaffoldBackgroundColor: Colors.blueGrey,
        ),
        home: Scaffold(
         appBar: AppBar(
      title: const Image(
      image: AssetImage('assets/images/smallslogan.png'), // profile pic needs to be replaced with company logo 
      fit: BoxFit.cover
      ),
      backgroundColor: Colors.blue,
      automaticallyImplyLeading: false,
      shape: const Border(
      bottom: BorderSide(
        color: Colors.black,
        width: 0.5,
      ),
      ),
    ),
          body: ListView.builder(
            itemCount: 5, 
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Some sort of new doc notification - ${index + 1}',
                    fillColor: const Color.fromARGB(255, 255, 255, 255), // Replace with your TextField color from home.dart
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