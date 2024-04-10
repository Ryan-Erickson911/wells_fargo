import 'package:flutter/material.dart';


class MapPage extends StatelessWidget {
        MapPage({super.key});
  final GlobalKey<ScaffoldState> mapKey = GlobalKey<ScaffoldState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: mapKey,
      appBar: AppBar(
        title: const Text('Placeholder Page'),
      ),
      body: const Center(
        child: Text('This is a placeholder page'),
      ),
    bottomNavigationBar: BottomNavigationBar(
      backgroundColor: Colors.blue,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          //key: scaffoldKey,
          icon: const Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          key: mapKey,
          icon: const Icon(Icons.map),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          //key: docsKey,
          icon: const Icon(Icons.newspaper),
          label: 'Documents',
        ),
      ],
      ),
    );
  }
}