import 'package:flutter/material.dart';
import 'package:transevilz/app/app.dart';
import 'package:transevilz/login/login.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
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
                  Container(
                    margin: const EdgeInsets.all(24),
                    child: _Form(),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 26),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(MediaQuery.of(context).size.width, 45),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => LoginScreen(),
                          ),
                        );
                      },
                      child: const Text("Kirim"),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TitleForm(title: 'Kata sandi baru'),
        TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            fillColor: const Color(0xFFE5F2FF),
            filled: true,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            hintText: 'Kata sandi baru',
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: const Icon(
              Icons.remove_red_eye,
              color: Colors.blue,
            ),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 24),
        const TitleForm(title: 'Konfirmasi kata sandi baru'),
        TextFormField(
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(10),
            fillColor: const Color(0xFFE5F2FF),
            filled: true,
            hintStyle: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            hintText: 'Konfirmasi kata sandi baru',
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: const Icon(
              Icons.remove_red_eye,
              color: Colors.blue,
            ),
          ),
          obscureText: true,
        ),
      ],
    );
  }
}
