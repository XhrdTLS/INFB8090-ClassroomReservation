import 'package:flutter/material.dart';
import 'package:mi_reserve/services/google_service.dart';
import 'package:mi_reserve/services/room_service.dart';

class SalasSearchForm extends StatefulWidget {
  final Function(String) onSubmit;

  const SalasSearchForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _SalasSearchFormState createState() => _SalasSearchFormState();
}

class _SalasSearchFormState extends State<SalasSearchForm> {
  final TextEditingController roomCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Sala por Código'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: roomCodeController,
              decoration: const InputDecoration(
                  labelText: 'Código de Sala', hintText: 'hola mundo'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                String roomCode = roomCodeController.text;
                // Llamada a la función onSubmit del widget padre
                widget.onSubmit(roomCode);

                String jwt = await GoogleService.getData('idToken');
                List<dynamic> respuesta =
                    await ApiSalas.getRoomId(jwt, roomCode);
              },
              child: const Text('Buscar Sala'),
            ),
          ],
        ),
      ),
    );
  }
}
