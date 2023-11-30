import 'package:mi_reserve/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MiMenu extends StatelessWidget {
  const MiMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()));
              }),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Salir'),
            onTap: () {
              SystemNavigator.pop(animated: true);
            },
          )
        ],
      ),
    );
  }
}
