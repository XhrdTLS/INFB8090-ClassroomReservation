import 'package:flutter/material.dart';

class SalasSWidget extends StatelessWidget {
  final List<dynamic> salas;

  const SalasSWidget({super.key, required this.salas});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reservas encontradas'),
      ),
      //cambiar body para adaptar a lo que entrega al buscar salas por codigo
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
