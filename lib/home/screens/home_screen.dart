import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transevilz/app/app.dart';
import 'package:transevilz/home/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
        body: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserJumbotron(),
              const SizedBox(height: 40),
              Image.asset(
                "assets/icon/chart_kurs.png",
              ),
              const SizedBox(height: 30),
              CurrencyExchange(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

Future<bool> _onBackPressed(BuildContext context) async {
  return await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) => AlertDialog(
      title: const Text(
        'Logout',
        style: TextStyle(color: Colors.red),
        // textAlign: TextAlign.center,
      ),
      content: const Text(
        'Apakah anda yakin untuk logout?',
        // textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text("Tidak"),
            ),
            TextButton(
              onPressed: () {
                logout().then(
                  (value) => Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const AppScreen(),
                    ),
                    (route) => false,
                  ),
                );
              },
              child: const Text(
                "Ya",
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Future logout() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove('token');
  prefs.remove('pin');
  prefs.remove('fullname');
  prefs.remove('email');
}
