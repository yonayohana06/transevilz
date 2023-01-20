import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transevilz/app/app.dart';
import 'package:transevilz/forgot/forgot.dart';
import 'package:transevilz/login/login.dart';

class ForgotPinScreen extends StatelessWidget {
  const ForgotPinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30),
            child: const ButtonApp(
              title: 'Lupa Pin Evilz ?',
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
                      'Masukkan email anda untuk membuat Pin Evilz baru',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  BlocProvider(
                    create: (_) => ForgotPinBloc(),
                    child: Container(
                      margin: const EdgeInsets.all(24),
                      child: _Form(),
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

class _Form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPinBloc, ForgotPinState>(
      listener: (context, state) {
        if (state is ForgotPinSuccess) {
          // showDialog(
          //   barrierDismissible: false,
          //   context: context,
          //   builder: (context) {
          //     return AlertDialog(
          //       actions: [
          //         Column(
          //           crossAxisAlignment: CrossAxisAlignment.stretch,
          //           children: [
          //             Padding(
          //               padding: const EdgeInsets.all(10.0),
          //               child: ElevatedButton(
          //                 style: ElevatedButton.styleFrom(
          //                   backgroundColor: Colors.blue,
          //                   fixedSize:
          //                       Size(MediaQuery.of(context).size.width, 45),
          //                   shape: RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(10),
          //                   ),
          //                 ),
          //                 onPressed: () {
          //                   Navigator.pushAndRemoveUntil(
          //                     context,
          //                     MaterialPageRoute(
          //                       builder: (_) => NewPassword(
          //                         email: context.read<ForgotPinBloc>().emailToSend,
          //                       ),
          //                     ),
          //                     (route) => false,
          //                   );
          //                 },
          //                 child: const Text("Cek Email Sekarang"),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ],
          //       content: const Text(
          //         "Permohonan Perubahan kata sandi telah dikirim ke email anda",
          //         textAlign: TextAlign.center,
          //         style: TextStyle(
          //           fontSize: 12,
          //           fontWeight: FontWeight.w400,
          //         ),
          //       ),
          //       title: Container(
          //         height: 50,
          //         width: 50,
          //         decoration: const BoxDecoration(
          //           image: DecorationImage(
          //             image: AssetImage("assets/forgot/email-verification.png"),
          //           ),
          //         ),
          //       ),
          //     );
          //   },
          // );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => NewPin(
                email: context.read<ForgotPinBloc>().emailToSend,
              ),
            ),
          );
        }
        if (state is ForgotPinFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.msg),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 2),
            ),
          );
        }
      },
      child: Form(
        key: context.read<ForgotPinBloc>().formKey,
        onChanged: () => context.read<ForgotPinBloc>().add(StatusButtonPin()),
        child: Column(
          children: [
            const TitleForm(title: 'Email'),
            TextFormField(
              inputFormatters: [
                FilteringTextInputFormatter.deny(
                    context.read<ForgotPinBloc>().emailFormat)
              ],
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: context.read<ForgotPinBloc>().email,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                fillColor: const Color(0xFFE5F2FF),
                filled: true,
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.red,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 1,
                    color: Colors.red,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              validator: context.read<ForgotPinBloc>().validateEmail,
            ),
            const SizedBox(height: 40),
            BlocBuilder<ForgotPinBloc, ForgotPinState>(
              builder: (context, state) {
                if (context.read<ForgotPinBloc>().isEnableButton) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, 45),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () =>
                        context.read<ForgotPinBloc>().add(SubmitEmailPin()),
                    child: const Text("Kirim"),
                  );
                }
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(MediaQuery.of(context).size.width, 45),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: null,
                  child: const Text("Kirim"),
                );
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
