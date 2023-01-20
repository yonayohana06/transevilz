import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:transevilz/app/app.dart';
import 'package:transevilz/forgot/forgot.dart';
import 'package:transevilz/login/login.dart';

class FormForgotPassword extends StatelessWidget {
  const FormForgotPassword({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotBloc, ForgotState>(
      listener: (context, state) {
        if (state is NewPassSuccess) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return AlertDialog(
                actions: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            fixedSize:
                                Size(MediaQuery.of(context).size.width, 45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AppScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          child: const Text("Masuk Sekarang"),
                        ),
                      ),
                    ],
                  ),
                ],
                content: const Text(
                  "Kata sandi anda berhasil diperbarui",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                title: Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/forgot/success.png"),
                    ),
                  ),
                ),
              );
            },
          );
        }
        if (state is NewPassFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 2),
            ),
          );
        }
      },
      child: Form(
        key: context.read<ForgotBloc>().formKey,
        onChanged: () => context.read<ForgotBloc>().add(StatusButton()),
        child: BlocBuilder<ForgotBloc, ForgotState>(
          builder: (context, state) {
            return Column(
              children: [
                const TitleForm(title: 'Kata sandi baru'),
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(16),
                    FilteringTextInputFormatter.allow(
                      context.read<ForgotBloc>().emoji,
                    )
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: context.read<ForgotBloc>().newPass,
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
                    suffixIcon: GestureDetector(
                      child: Icon(
                        context.read<ForgotBloc>().showPass
                            ? FeatherIcons.eyeOff
                            : FeatherIcons.eye,
                        color: Colors.blue,
                        size: 20,
                      ),
                      onTap: () =>
                          context.read<ForgotBloc>().add(ShowNewPass()),
                    ),
                  ),
                  obscureText: context.read<ForgotBloc>().showPass,
                  validator: context.read<ForgotBloc>().validatePassword,
                ),
                const SizedBox(height: 24),
                const TitleForm(title: 'Konfirmasi kata sandi baru'),
                TextFormField(
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(16),
                    FilteringTextInputFormatter.allow(
                      context.read<ForgotBloc>().emoji,
                    )
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: context.read<ForgotBloc>().confirmPass,
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
                    suffixIcon: GestureDetector(
                      child: Icon(
                        context.read<ForgotBloc>().showPassAgain
                            ? FeatherIcons.eyeOff
                            : FeatherIcons.eye,
                        color: Colors.blue,
                        size: 20,
                      ),
                      onTap: () =>
                          context.read<ForgotBloc>().add(ShowNewPassAgain()),
                    ),
                  ),
                  obscureText: context.read<ForgotBloc>().showPassAgain,
                  validator: context.read<ForgotBloc>().validateConfirmPass,
                ),
                const SizedBox(height: 20),
                BlocBuilder<ForgotBloc, ForgotState>(
                  builder: (context, state) {
                    if (context.read<ForgotBloc>().buttonEnable) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 45),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          context.read<ForgotBloc>().emailToSend = email;
                          context.read<ForgotBloc>().add(SubmitNewPassword());
                        },
                        child: (state is ForgotLoading)
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              )
                            : const Text("Kirim"),
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
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
}
