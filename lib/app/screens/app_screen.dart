import 'package:flutter/material.dart';
import 'package:transevilz/app/app.dart';
import 'package:transevilz/profile/profile.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trans Evilz',
      home: SplashScreen(),
    );
  }
}
