import 'dart:async';

import 'package:flutter/material.dart';
import 'package:transevilz/app/app.dart';
import 'package:transevilz/login/login.dart';
import 'package:transevilz/onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 500), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2075F3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "TransEvilz",
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 160,
              width: 160,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/splash/splash.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
