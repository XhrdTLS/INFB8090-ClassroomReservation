import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          label: const Text('Volver a intentar'),
          backgroundColor: const Color.fromARGB(255, 255, 183, 167),
        ),
        body: const Column(
          children: <Widget>[
            SizedBox(height: 150, width: 100),
            Text('No pudimos autenticar, inténtalo nuevamente',
                style: TextStyle(fontSize: 20), textAlign: TextAlign.center),
          ],
        ));
  }
}
