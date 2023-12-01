import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mi_reserve/services/google_service.dart';
import 'package:mi_reserve/widgets/navbar.dart';
import 'package:google_fonts/google_fonts.dart';

class ReservePage extends StatelessWidget {
  const ReservePage({super.key});

  static final Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Reservar')),
        bottomNavigationBar: const MyNavBar(),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 2, 66, 124),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                    child: Column(
                  children: [
                    Text(
                      'Reservar',
                    ),
                    Text('Selecciona la sala o x'),
                  ],
                )),
              ),
            ]),
          ),
        ));
  }
}
