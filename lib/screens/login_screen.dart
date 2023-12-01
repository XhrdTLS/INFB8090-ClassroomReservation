import 'package:http/http.dart';
import 'package:mi_reserve/screens/error_screen.dart';
import 'package:mi_reserve/widgets/navigator_bar.dart';
import 'package:mi_reserve/services/google_service.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class LoginScreen extends StatelessWidget {
  static final Logger _logger = Logger();

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: <Widget>[
            /// Banner de la Aplicación
            Container(
                width: double.infinity,
                height: 300,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('lib/assets/banner_inicio.png')))),

            ///

            const Text(
              textAlign: TextAlign.center,
              'Inicia Sesión con google para comenzar a Reservar Salas',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),

            const SizedBox(
              height: 30,
            ),

            /// Boton Inicio de sesión con Google
            SizedBox(
              height: 100,
              child: ElevatedButton(
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.person,
                      size: 35,
                    ),
                    Text(
                      'Iniciar con Google',
                      style: TextStyle(fontSize: 25),
                    ),
                  ],
                ),
                onPressed: () {
                  GoogleService.login().then((result) {
                    if (result) {
                      _logger.i("Perfecto");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const BottomNavigationApp()));
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
          ],
        ),
      ),
    );
  }
}
