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
      );
  }
}