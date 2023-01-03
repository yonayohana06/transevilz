import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transevilz/login/login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: _View(),
    );
  }
}

class _View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 40),
              child: Column(
                children: [
                  const Text(
                    "Hallo !",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Belum punya akun ?  ",
                        style: TextStyle(
                          color: Color(0xFF929292),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        child: const Text(
                          "Lakukan Registrasi",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 220,
              width: 220,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/login/login.png'),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(24),
              child: const FormLogin(),
            ),
          ],
        ),
      ),
    );
  }
}
