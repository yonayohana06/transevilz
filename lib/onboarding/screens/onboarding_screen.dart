import 'package:flutter/material.dart';
import 'package:transevilz/onboarding/onboarding.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 40),
          OnBoardCarousel(),
        ],
      ),
    );
  }
}
