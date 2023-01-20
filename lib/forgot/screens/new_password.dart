import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transevilz/forgot/forgot.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40, bottom: 10),
            child: const Text(
              'Buat Kata Sandi Baru',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 40),
                    height: 220,
                    width: 220,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/login/forgot-password.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 24, right: 24, bottom: 40),
                    child: const Text(
                      'Buat kata sandi baru anda',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => ForgotBloc(),
                    child: Container(
                      margin: const EdgeInsets.all(24),
                      child: FormForgotPassword(email: email),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
