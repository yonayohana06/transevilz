import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transevilz/app/app.dart';
import 'package:transevilz/onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _checkOnboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final valueOnboard = prefs.getBool('skipOnboard');

    Timer(const Duration(milliseconds: 800), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => valueOnboard == true
              ? const AppScreen()
              : const OnBoardingScreen(),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _checkOnboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              height: 160,
              width: 160,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/splash/splash_2.png'),
                ),
              ),
            ),
            const Text(
              "TransEvilz",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}
