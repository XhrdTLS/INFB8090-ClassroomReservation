import 'package:flutter/material.dart';
import 'package:mi_reserve/services/google_service.dart';
import 'package:mi_reserve/services/reserve_service.dart';
import 'package:mi_reserve/setters/get_reserve.dart';
import 'package:mi_reserve/setters/post_reserve.dart';
import 'package:mi_reserve/views/reserve.dart';

class SearchReserve extends StatefulWidget {
  final Function(String, String, String) onSubmit;

  const SearchReserve({super.key, required this.onSubmit});

  @override
  _SearchReserveState createState() => _SearchReserveState();
}

class _SearchReserveState extends State<SearchReserve> {
  final TextEditingController roomCodeController = TextEditingController();
  final TextEditingController bookingTokenController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

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
            TextField(
              controller: roomCodeController,
              decoration: const InputDecoration(
                  labelText: 'Código de Sala', hintText: 'ejemplo: B01'),
            ),
            TextField(
              controller: bookingTokenController,
              decoration:
                  const InputDecoration(labelText: 'Token', hintText: 'token'),
            ),
            TextField(
              controller: dateController,
              decoration: const InputDecoration(
                  labelText: 'Fecha', hintText: 'hola mundo'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                String roomCode = roomCodeController.text;
                String bookingToken = bookingTokenController.text;
                String date = dateController.text;

                // Llamada a la función onSubmit del widget padre
                widget.onSubmit(roomCode, bookingToken, date);
                String jwt = await GoogleService.getData('idToken');
                //mapeamos el requestBody con los datos que sacamos del formulario
                Map<String, dynamic> requestBody = {
                  'roomCode': roomCode,
                  'bookingToken': bookingToken,
                  'date': date,
                };
                List<dynamic> respuesta =
                    await ApiReserve.reserveSearch(jwt, requestBody);
              },
              child: const Text('Enviar Datos'),
            ),
          ],
        ),
      ),
    );
  }
}
