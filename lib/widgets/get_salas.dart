import 'package:flutter/material.dart';
class GetRooms extends StatelessWidget {
  final List<dynamic> rooms;
  const GetRooms({super.key, required this.rooms});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> room = rooms[index];
          return Card(
              child: ListTile(
                  title: Text('Codigo ${room["code"]}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          'Ubicación: ${room["location"] ?? "No especificada"}'),
                      Text('Nombre: ${room["name"] ?? "No especificada"}'),
                      Text(
                          'Capacidad: ${room["capacity"] ?? "No especificada"}'),
                    ],
                  )));
        });
  }
}
