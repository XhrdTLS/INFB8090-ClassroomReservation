import 'package:flutter/material.dart';

class RequestReserve extends StatelessWidget {
  final List<dynamic> salas;

  const RequestReserve({super.key, required this.salas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reserva creada'),
      ),
      body: ListView.builder(
        itemCount: salas.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> sala = salas[index];
          return Card(
            child: ListTile(
              title: Text('Codigo ${sala["code"]}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Ubicación: ${sala["location"] ?? "No especificada"}'),
                  Text('Nombre: ${sala["name"] ?? "No especificada"}'),
                  Text('Capacidad: ${sala["capacity"] ?? "No especificada"}'),
                  // Otros detalles según sea necesario
                ],
              ),
              // Agregar aquí cualquier otra información que desees mostrar
            ),
          );
        },
      ),
    );
  }
}
