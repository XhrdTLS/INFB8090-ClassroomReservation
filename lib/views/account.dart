import 'package:flutter/material.dart';
import 'package:mi_reserve/screens/login_screen.dart';
import 'package:mi_reserve/services/google_service.dart';
import 'package:logger/logger.dart';

Color primaryBlue = const Color.fromARGB(255, 2, 66, 124);

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int currentPageIndex = 0;
  static final Logger _logger = Logger();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: <Widget>[
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: primaryBlue,
                    width: 3,
                  ),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Text('MI CUENTA',
                        style: TextStyle(
                            color: primaryBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  const Text(
                    'Revisa tus reservas o cierra tu sesión',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            /// Información recuperada de Google
            Container(
              padding: EdgeInsets.all(20),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color.fromARGB(255, 212, 227, 255),
              ),
              child: Column(
                children: <Widget>[
                  ClipOval(
                    child: FutureBuilder<String>(
                        future: GoogleService.getData('foto'),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            return Image.network('${snapshot.data}');
                          } else if (snapshot.hasError) {
                            return const Icon(Icons.error);
                          } else {
                            return const CircularProgressIndicator();
                          }
                        }),
                  ),
                  Center(
                    child: FutureBuilder<String>(
                      future: GoogleService.getData('nombre'),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return Text(
                            '${snapshot.data}',
                            style: TextStyle(
                                color: primaryBlue,
                                fontSize: 20,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.bold),
                          );
                        } else if (snapshot.hasError) {
                          _logger.e('${snapshot.error}');
                          return const Text('Hola!');
                        } else {
                          return const CircularProgressIndicator();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          GoogleService.disconnect();
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        },
        icon: const Icon(Icons.logout),
        label: const Text('Desconectar Sesión'),
        backgroundColor: const Color.fromARGB(255, 255, 183, 167),
      ),
    );
  }
}
