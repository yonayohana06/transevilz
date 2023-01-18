import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:transevilz/app/app.dart';
import 'package:transevilz/login/login.dart';

class PinScreen extends StatelessWidget {
  const PinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: _View(),
    );
  }
}

class _View extends StatelessWidget {
  Future<bool> _onBackPressed(BuildContext context) async {
    return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text(
          'Logout',
          style: TextStyle(color: Colors.red),
          // textAlign: TextAlign.center,
        ),
        content: const Text(
          'Apakah anda yakin untuk logout?',
          // textAlign: TextAlign.center,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text("Tidak"),
              ),
              TextButton(
                onPressed: () {
                  logout().then(
                    (value) => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const AppScreen(),
                      ),
                      (route) => false,
                    ),
                  );
                },
                child: const Text(
                  "Ya",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Future logout() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    prefs.remove('pin');
    prefs.remove('userData');
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 40),
              child: const Text(
                'Membuat Pin Evilz',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 24, right: 24, bottom: 40),
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
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(24),
                child: _Form(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Form extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is PinSucces) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              // Future.delayed(
              //   const Duration(seconds: 1),
              //   () => Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const LoginScreen(),
              //     ),
              //   ),
              // );
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
                                builder: (context) => const MainMenu(),
                              ),
                              (route) => false,
                            );
                          },
                          child: const Text("OK"),
                        ),
                      ),
                    ],
                  ),
                ],
                content: const Text(
                  "PIN berhasil dibuat",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                title: const Text(
                  "Berhasil",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              );
            },
          );
        }
        if (state is PinFailed) {
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
        key: context.read<LoginBloc>().formKey,
        onChanged: () => context.read<LoginBloc>().add(ButtonLogin()),
        child: Column(
          children: [
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return Column(
                  children: [
                    const TitleForm(title: 'Buat Pin Evilz'),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: context.read<LoginBloc>().pin,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        fillColor: const Color(0xFFE5F2FF),
                        filled: true,
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        hintText: 'Masukkan 6 digit Pin',
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
                            context.read<LoginBloc>().showPass
                                ? FeatherIcons.eyeOff
                                : FeatherIcons.eye,
                            color: Colors.blue,
                            size: 20,
                          ),
                          onTap: () =>
                              context.read<LoginBloc>().add(ShowPassword()),
                        ),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(6),
                      ],
                      validator: context.read<LoginBloc>().validatePin,
                      keyboardType: TextInputType.phone,
                      obscureText: context.read<LoginBloc>().showPass,
                    ),
                    const SizedBox(height: 24),
                    const TitleForm(title: 'Konfirmasi Pin Evilz'),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: context.read<LoginBloc>().confirmPin,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        fillColor: const Color(0xFFE5F2FF),
                        filled: true,
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        hintText: 'Masukkan 6 digit Pin yang telah dibuat',
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
                            context.read<LoginBloc>().showPin
                                ? FeatherIcons.eyeOff
                                : FeatherIcons.eye,
                            color: Colors.blue,
                            size: 20,
                          ),
                          onTap: () => context.read<LoginBloc>().add(ShowPin()),
                        ),
                      ),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(6),
                      ],
                      validator: context.read<LoginBloc>().validateConfirmPin,
                      keyboardType: TextInputType.phone,
                      obscureText: context.read<LoginBloc>().showPin,
                    ),
                  ],
                );
              },
            ),
            Flexible(flex: 1, child: Container()),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (context.read<LoginBloc>().isEnableButton) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, 45),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      context.read<LoginBloc>().add(SubmitPin());
                    },
                    child: (state is LoginLoading)
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
        ),
      ),
    );
  }
}
