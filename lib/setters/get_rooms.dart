import 'package:flutter/material.dart';

class GetRooms extends StatelessWidget {
  final List<dynamic> rooms;
  const GetRooms({super.key, required this.rooms});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Volver a Reservas')),
      body: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          itemCount: rooms.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> room = rooms[index];
            return Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                color: const Color.fromARGB(255, 212, 227, 255),
                child: ListTile(
                    title: Text(
                      'Codigo ${room["code"]}',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 20),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ubicación: ${room["location"] ?? "No especificada"}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Nombre: ${room["name"] ?? "No especificada"}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Capacidad: ${room["capacity"] ?? "No especificada"}',
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    )));
          }),
    );
  }
}
