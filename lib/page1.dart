import 'package:flutter/material.dart';


class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Placeholder Page'),
      ),
      body: const Center(
        child: Text('This is a placeholder page'),
      ),
    );
  }
}