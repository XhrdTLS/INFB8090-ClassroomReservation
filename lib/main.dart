import 'package:flutter/material.dart';
//import 'package:classroom_reservation/screens/login.dart';
import 'package:classroom_reservation/screens/home.dart';

// ...

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 2, 66, 124)),
          useMaterial3: true,
        ),
        title: "Mi Reserva UTEM",
        home: MyHomePage(title: "Mi Reserva UTEM")
        );
  }
}
