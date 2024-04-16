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
          scaffoldBackgroundColor:Colors.blueGrey, // Replace with your background color from home.dart
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Scrollable List'),
            backgroundColor: Colors.blueGrey,
          ),
          body: ListView.builder(
            itemCount: 20, 
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Text Field ${index + 1}',
                    fillColor: Colors.grey, // Replace with your TextField color from home.dart
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