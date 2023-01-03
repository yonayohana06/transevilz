import 'package:flutter/material.dart';
import 'package:transevilz/login/login.dart';
import 'package:transevilz/onboarding/onboarding.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // const SizedBox(height: 60),
          Flexible(flex: 1, child: Container()),
          Center(
            child: OnBoardCarousel(
              onChanged: (currentPage) {
                setState(() {
                  _currentPage = currentPage;
                });
              },
            ),
          ),
          const SizedBox(height: 80),
          OnBoardIndicator(currentPage: _currentPage),
          Flexible(flex: 1, child: Container()),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(100, 45),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                  (route) => false,
                );
              },
              child: const Text("Mulai"),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
