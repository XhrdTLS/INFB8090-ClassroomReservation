import 'package:flutter/material.dart';
import 'package:mi_reserve/services/google_service.dart';
import 'package:mi_reserve/services/room_service.dart';
import 'package:mi_reserve/setters/cancel_reserve.dart';
import 'package:mi_reserve/setters/get_reserve.dart';
import 'package:mi_reserve/setters/get_rooms.dart';
import 'package:mi_reserve/setters/post_reserve.dart';
import 'package:mi_reserve/setters/search_reserve.dart';

Color primaryBlue = const Color.fromARGB(255, 2, 66, 124);

class ReservePage extends StatelessWidget {
  const ReservePage({super.key});

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
                    child: Text('RESERVAS',
                        style: TextStyle(
                            color: primaryBlue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ),
                  const SizedBox(
                    height: 3.0,
                  ),
                  const Text(
                    'Revisa las salas disponibles y crea una nueva reserva',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PostReserve(
                                onSubmit:
                                    (roomCode, date, start, quantity) async {},
                              )));
                },
                child: const Row(
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      weight: 10,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Nueva Reserva',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SearchReserve(
                                onSubmit:
                                    (roomCode, bookingToken, date) async {},
                              )));
                },
                child: const Row(
                  children: <Widget>[
                    Icon(
                      Icons.search,
                      weight: 10,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Buscar Reserva',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CancelReserve(
                                onSubmit: (token, roomCode) async {},
                              )));
                },
                child: const Row(
                  children: <Widget>[
                    Icon(
                      Icons.cancel_outlined,
                      weight: 10,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Cancelar Reserva',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ))
          ]),
        ),
      ),

      /// Botón que revisa las salas disponibles
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          String jwt = await GoogleService.getData('idToken');
          List<dynamic> respuesta = await ApiSalas.getRooms(jwt);
          if (respuesta.isNotEmpty) {
            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GetRooms(rooms: respuesta),
              ),
            );
          } else {
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('No se encontraron salas disponibles.'),
              ),
            );
          }
        },
        icon: const Icon(Icons.remove_red_eye_rounded),
        label: const Text('Ver Salas Disponibles'),
      ),
    );
  }
}
