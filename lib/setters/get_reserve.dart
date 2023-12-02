import 'package:flutter/material.dart';
import 'package:mi_reserve/services/google_service.dart';
import 'package:mi_reserve/services/reserve_service.dart';

class GetReserve extends StatefulWidget {
  final Function(String, String) onSubmit;

  const GetReserve({super.key, required this.onSubmit});

  @override
  _GetReserveState createState() => _GetReserveState();
}

class _GetReserveState extends State<GetReserve> {
  final TextEditingController roomCodeController = TextEditingController();
  final TextEditingController startController = TextEditingController();

  String? roomCodeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese el Código de Sala';
    }
    return null;
  }

  String? startValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese el Inicio';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingrese Datos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: roomCodeController,
              decoration: const InputDecoration(
                  labelText: 'Código de Sala', hintText: 'hola mundo'),
              validator: roomCodeValidator,
            ),
            TextFormField(
              controller: startController,
              decoration: const InputDecoration(
                  labelText: 'Fecha', hintText: 'hola mundo'),
              validator: startValidator,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                String roomCode = roomCodeController.text;
                String start = startController.text;

                // Llamada a la función onSubmit del widget padre
                widget.onSubmit(roomCode, start);
                String jwt = await GoogleService.getData('idToken');
                List<dynamic> respuesta =
                    await ApiReserve.reserveInfo(jwt, roomCode, start);
              },
              child: const Text('Enviar Datos'),
            ),
          ],
        ),
      ),
    );
  }
}
