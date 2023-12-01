import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:mi_reserve/services/google_service.dart';
import 'package:mi_reserve/services/room_service.dart';
import 'package:mi_reserve/widgets/get_salas.dart';

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
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          String jwt = await GoogleService.getData('idToken');
          List<dynamic> respuesta = await ApiSalas.getRooms(jwt);
          if (respuesta.isNotEmpty) {
            GetRooms(rooms: respuesta);
          } else {
            // Puedes manejar el caso donde no se obtienen salas
            // ignore: use_build_context_synchronously
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('No se encontraron salas disponibles.'),
              ),
            );
          }
        },
        icon: const Icon(Icons.settings_backup_restore_rounded),
        label: const Text('Actualizar'),
      ),
    );
  }
}
