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
          primaryColor: Colors.white, 
          scaffoldBackgroundColor: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
          title: const Image(
            image: AssetImage('assets/images/smallslogan.png'), // profile pic needs to be replaced with company logo 
            fit: BoxFit.cover
          ),
          backgroundColor: Colors.blue,
          shape: const Border(
            bottom: BorderSide(
              color: Colors.black,
              width: 0.5,
            ),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Menu',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
              ),
              ListTile(
          title: const Text('Item 1'),
          onTap: () {
            // Handle item 1 tap
          },
              ),
              ListTile(
          title: const Text('Item 2'),
          onTap: () {
            // Handle item 2 tap
          },
              ),
              // Add more ListTile widgets for additional menu items
            ],
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
                    color: Colors.blue, // Set text color to black
                  ),
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Notification/Info for User Document - ${index + 1}',
                    fillColor: Colors.white, // Replace with your TextField color from home.dart
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