import 'package:mi_reserve/screens/error_screen.dart';
import 'package:mi_reserve/screens/home_screen.dart';
import 'package:mi_reserve/screens/testnavbar.dart';
import 'package:mi_reserve/services/google_service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LoginScreen extends StatelessWidget {
  static final Logger _logger = Logger();

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: ElevatedButton(
            child: const Row(
              children: [
                Icon(Icons.person),
                Text(
                  'Ingresar',
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
            onPressed: () {
              GoogleService.login().then((result) {
                if (result) {
                  _logger.i("Perfecto");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BottomNavigationApp()));
                } else {
                  _logger.f("F");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ErrorScreen()));
                }
              });
            },
          ),
        ),
      ),
    );
  }
}
