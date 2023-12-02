import 'package:flutter/material.dart';
import 'package:mi_reserve/services/google_service.dart';
import 'package:mi_reserve/services/reserve_service.dart';

class PostReserve extends StatefulWidget {
  final Function(String, String, String, String) onSubmit;

  const PostReserve({super.key, required this.onSubmit});

  @override
  _PostReserveState createState() => _PostReserveState();
}

class _PostReserveState extends State<PostReserve> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController roomCodeController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();

  String? roomCodeValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese el Código de Sala';
    }
    return null;
  }

  String? dateValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese la fecha';
    }
    return null;
  }

  String? startValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese el inicio';
    }
    return null;
  }

  String? quantityValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingrese la Cantidad';
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
        child: Form(
          key: _formKey,
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
                controller: dateController,
                decoration: const InputDecoration(
                    labelText: 'Fecha', hintText: 'hola mundo'),
                validator: dateValidator,
              ),
              TextFormField(
                controller: startController,
                decoration: const InputDecoration(
                    labelText: 'Inicio', hintText: 'hola mundo'),
                validator: startValidator,
              ),
              TextFormField(
                controller: quantityController,
                decoration: const InputDecoration(
                    labelText: 'Cantidad', hintText: 'hola mundo'),
                validator: quantityValidator,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    String roomCode = roomCodeController.text;
                    String date = dateController.text;
                    String start = startController.text;
                    String quantity = quantityController.text;

                    // Llamada a la función onSubmit del widget padre
                    widget.onSubmit(roomCode, date, start, quantity);
                    String jwt = await GoogleService.getData('idToken');
                    //mapeamos el requestBody con los datos que sacamos del formulario
                    Map<String, dynamic> requestBody = {
                      'roomCode': roomCode,
                      'date': date,
                      'start': start,
                      "quantity": quantity,
                    };
                    List<dynamic> respuesta =
                        await ApiReserve.reserveRequest(jwt, requestBody);
                  }
                },
                child: const Text('Enviar Datos'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
