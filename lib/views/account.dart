import 'package:flutter/material.dart';
import 'package:mi_reserve/services/google_service.dart';
import 'package:mi_reserve/widgets/navbar.dart';
import 'package:logger/logger.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int currentPageIndex = 0;

  static final Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: const MyNavBar(),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 2, 66, 124),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: const Center(
                  child: Text(
                    'Cuenta',
                  ),
                ),
              )
            ]),
          ),
        ));
  }
}
