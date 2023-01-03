import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transevilz/home/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: Colors.blue,

        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.light, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
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
