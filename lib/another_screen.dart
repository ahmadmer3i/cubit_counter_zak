import 'package:flutter/material.dart';

class AnotherScreen extends StatelessWidget {
  const AnotherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Another Screen'),
      ),
      body: const Center(
        child: Text(
          'Another Screen',
          style: TextStyle(fontSize: 48),
        ),
      ),
    );
  }
}
