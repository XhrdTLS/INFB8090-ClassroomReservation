import 'package:flutter/material.dart';
import 'package:mi_reserve/screens/home_screen.dart';
import 'package:mi_reserve/views/account.dart';
import 'package:mi_reserve/views/reserve.dart';

/// Flutter code sample for [NavigationBar].

class NavigationApp extends StatelessWidget {
  const NavigationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const BottomNavigationApp(),
    );
  }
}

class BottomNavigationApp extends StatefulWidget {
  const BottomNavigationApp({super.key});

  @override
  State<BottomNavigationApp> createState() => _BottomNavigationAppState();
}

class _BottomNavigationAppState extends State<BottomNavigationApp> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.calendar_today),
            icon: Icon(Icons.calendar_today_outlined),
            label: 'Reserva',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Inicio',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline_rounded),
            selectedIcon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
      body: <Widget>[
        /// Navigation -> Pantalla de Reservas
        const ReservePage(),

        /// Navigation -> Pantalla de Inicio
        const HomePage(),

        /// Navigation -> Pantalla de Usuario
        const AccountPage(),
      ][currentPageIndex],
    );
  }
}
