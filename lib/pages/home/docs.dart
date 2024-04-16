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
          scaffoldBackgroundColor:const Color.fromARGB(255, 130, 199, 255), // Replace with your background color from home.dart
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Documents Page',selectionColor: Color.fromARGB(255, 255, 255, 255),),
            backgroundColor: Colors.blue,
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