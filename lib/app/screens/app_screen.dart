import 'package:flutter/material.dart';
import 'package:transevilz/register/screens/otp.dart';
import 'package:transevilz/register/screens/register_profile_form.dart';
import 'package:transevilz/register/screens/register_screen.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Trans Evilz',
      home: RegisterRequire(),
    );
  }
}