import 'package:flutter/material.dart';
import 'package:mi_reserve/screens/account_screen.dart';
import 'package:mi_reserve/screens/home_screen.dart';
import 'package:mi_reserve/screens/reserve.dart';

int currentPageIndex = 0;

class MyNavBar extends StatefulWidget {
  const MyNavBar({super.key});

  @override
  State<MyNavBar> createState() => _MyNavBarState();
}

class _MyNavBarState extends State<MyNavBar> {
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
      selectedIndex: currentPageIndex,
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
          if (index == 0) {
            Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const ReservePage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  }),
            );
          }
          if (index == 1) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const MyHomePage(title: 'Home Page')));
          }
          if (index == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AccountPage()));
          }
        });
      },
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
