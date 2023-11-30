import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fuiste bueno'),
      ),
      body: const Center(
        child: Text('No pudimos autenticar'),
      ),
    );
  }
}
