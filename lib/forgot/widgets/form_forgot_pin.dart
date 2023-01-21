import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:transevilz/forgot/forgot.dart';
import 'package:transevilz/login/login.dart';

class FormForgotPin extends StatelessWidget {
  const FormForgotPin({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPinBloc, ForgotPinState>(
      listener: (context, state) {
        if (state is ForgotPinSuccess) {
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
                            int count = 0;
                            Navigator.of(context).popUntil(
                              (route) {
                                return count++ == 2;
                              },
                            );
                            // Navigator.pushAndRemoveUntil(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => const AppScreen(),
                            //   ),
                            //   (route) => false,
                            // );
                          },
                          child: const Text("Selesai"),
                        ),
                      ),
                    ],
                  ),
                ],
                content: const Text(
                  "Pin Evilz anda berhasil diperbarui",
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
        child: BlocBuilder<ForgotPinBloc, ForgotPinState>(
          builder: (context, state) {
            return Column(
              children: [
                const TitleForm(title: 'Pin baru'),
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(6),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: context.read<ForgotPinBloc>().pin,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    fillColor: const Color(0xFFE5F2FF),
                    filled: true,
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    hintText: 'pin baru',
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
                        context.read<ForgotPinBloc>().showPin
                            ? FeatherIcons.eyeOff
                            : FeatherIcons.eye,
                        color: Colors.blue,
                        size: 20,
                      ),
                      onTap: () =>
                          context.read<ForgotPinBloc>().add(ShowNewPin()),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  obscureText: context.read<ForgotPinBloc>().showPin,
                  validator: context.read<ForgotPinBloc>().validatePin,
                ),
                const SizedBox(height: 24),
                const TitleForm(title: 'Konfirmasi pin baru'),
                TextFormField(
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(6),
                  ],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: context.read<ForgotPinBloc>().confirmPin,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    fillColor: const Color(0xFFE5F2FF),
                    filled: true,
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    hintText: 'Konfirmasi pin baru',
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
                        context.read<ForgotPinBloc>().showPinConfirm
                            ? FeatherIcons.eyeOff
                            : FeatherIcons.eye,
                        color: Colors.blue,
                        size: 20,
                      ),
                      onTap: () =>
                          context.read<ForgotPinBloc>().add(ShowNewPinAgain()),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  obscureText: context.read<ForgotPinBloc>().showPinConfirm,
                  validator: context.read<ForgotPinBloc>().validateConfirmPin,
                ),
                const SizedBox(height: 20),
                BlocBuilder<ForgotPinBloc, ForgotPinState>(
                  builder: (context, state) {
                    if (context.read<ForgotPinBloc>().isEnableButton) {
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
                          context.read<ForgotPinBloc>().emailToSend = email;
                          context.read<ForgotPinBloc>().add(SubmitNewPin());
                        },
                        child: (state is ForgotPinLoading)
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
