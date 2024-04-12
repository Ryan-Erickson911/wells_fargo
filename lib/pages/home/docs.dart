import 'package:flutter/material.dart';


class DocsPage extends StatelessWidget {
        DocsPage({super.key});
  final GlobalKey<ScaffoldState> docsKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: docsKey,
      appBar: AppBar(
        title: const Text('Placeholder Page'),
      ),
      body: const Center(
        child: Text('This is a placeholder page'),
      ),
    );
  }
}