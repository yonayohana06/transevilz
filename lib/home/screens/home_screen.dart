import 'package:flutter/material.dart';
import 'package:transevilz/home/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
