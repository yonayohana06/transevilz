import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transevilz/app/app.dart';
import 'package:transevilz/forgot/forgot.dart';

class NewPin extends StatelessWidget {
  const NewPin({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30, bottom: 10),
            child: const ButtonApp(
              title: 'Buat Pin Evilz Baru',
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 20,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.grey[600],
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            'Pin Evilz ini digunakan untuk proses '
                            'pembayaran/transfer pada TransEvilz. '
                            'Gunakan kombinasi 6 angka tanpa huruf dan simbol',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
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
                        image: AssetImage('assets/login/forgot-password.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        const EdgeInsets.only(left: 24, right: 24, bottom: 40),
                    child: const Text(
                      'Buat pin evilz yang baru',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  BlocProvider(
                    create: (context) => ForgotPinBloc(),
                    child: Container(
                      margin: const EdgeInsets.all(24),
                      child: FormForgotPin(email: email),
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
