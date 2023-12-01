import 'package:flutter/material.dart';
import 'package:mi_reserve/views/account.dart';
import 'package:mi_reserve/screens/home_screen.dart';
import 'package:mi_reserve/views/reserve.dart';

class MyNavBar extends StatefulWidget {
  const MyNavBar({super.key});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  // pantallas para ser llamadas
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      selectedIndex: currentPageIndex,
      onDestinationSelected: (int index) {},
      destinations: const <Widget>[
        NavigationDestination(
          icon: Icon(Icons.calendar_today),
          label: 'Reservar',
        ),
        NavigationDestination(
          icon: Icon(Icons.home_filled),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.bookmark),
          icon: Icon(Icons.book_outlined),
          label: 'Historial',
        ),
      ],
    );
  }
}
