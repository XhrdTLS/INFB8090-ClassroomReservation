import 'package:flutter/material.dart';
import 'package:mi_reserve/services/google_service.dart';
import 'package:mi_reserve/services/reserve_service.dart';

class CancelReserve extends StatefulWidget {
  final Function(String, String) onSubmit;

  const CancelReserve({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _CancelReserveState createState() => _CancelReserveState();
}

class _CancelReserveState extends State<CancelReserve> {
  final TextEditingController roomCodeController = TextEditingController();
  final TextEditingController bookingTokenController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cancelar Reserva'),
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
            TextField(
              controller: bookingTokenController,
              decoration: const InputDecoration(
                  labelText: 'Token', hintText: 'hola mundo'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                String roomCode = roomCodeController.text;
                String bookingToken = bookingTokenController.text;

                // Llamada a la función onSubmit del widget padre
                widget.onSubmit(roomCode, bookingToken);

                String jwt = await GoogleService.getData('idToken');

                await ApiReserve.reserveCancel(jwt, bookingToken);
              },
              child: const Text('Cancelar Reserva'),
            ),
          ],
        ),
      ),
    );
  }
}
