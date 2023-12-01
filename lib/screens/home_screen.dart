import 'package:mi_reserve/services/google_service.dart';
import 'package:mi_reserve/services/room_service.dart';
import 'package:mi_reserve/views/reserve.dart';

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

  Color primaryBlue = const Color.fromARGB(255, 2, 66, 124);

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 1;
  static final Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ), //por eliminar
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
                      child: FutureBuilder<String>(
                        future: GoogleService.getData('nombre'),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
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
                    const SizedBox(
                      height: 3.0,
                    ),
                    const Text(
                      '¡Que bueno verte!',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    const Text(
                        'Reserva salas de clases, de forma sencilla en un solo lugar, cancela o agenda cuando quieras')
                  ],
                ),
              ),
              FloatingActionButton(
                  heroTag: 'uniqueTag',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ReservePage(),
                        ));
                  }),
            ]),
          ),
        ));
  }
}
