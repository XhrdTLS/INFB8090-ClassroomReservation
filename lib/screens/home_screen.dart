import 'package:mi_reserve/services/google_service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class HomeScreen extends StatelessWidget {
  static final Logger _logger = Logger();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: FutureBuilder<String>(
                future: GoogleService.getData('nombre'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Text('${snapshot.data}');
                  } else if (snapshot.hasError) {
                    _logger.e('${snapshot.error}');
                    return const Text('Nombre');
                  } else {
                    return const CircularProgressIndicator();
                  }
                })),
        body: Center(
          child: ClipOval(
            child: FutureBuilder<String>(
                future: GoogleService.getData('foto'),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Image.network('${snapshot.data}');
                  } else if (snapshot.hasError) {
                    return const Icon(Icons.error);
                  } else {
                    return const CircularProgressIndicator();
                  }
                }),
          ),
        ));
  }
}
