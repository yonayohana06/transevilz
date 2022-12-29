import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:transevilz/forgot/forgot.dart';
import 'package:transevilz/login/login.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({super.key});

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
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSucces) {
          showDialog(
            barrierDismissible: true,
            context: context,
            builder: (context) {
              // Future.delayed(
              //   const Duration(seconds: 1),
              //   () => Navigator.pushReplacement(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => const PinScreen(),
              //     ),
              //   ),
              // );
              return AlertDialog(
                actions: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"),
                  ),
                ],
                // content: Container(
                //   alignment: Alignment.center,
                //   height: 40,
                //   width: 20,
                //   child: const CircularProgressIndicator(
                //     valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                //   ),
                // ),
                title: const Text(
                  "Login Berhasil",
                  style: TextStyle(color: Colors.green, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              );
            },
          );
        }
        if (state is LoginFailed) {
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
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Column(
              children: [
                const TitleForm(title: 'Email'),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: context.read<LoginBloc>().email,
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
                  ),
                  validator: context.read<LoginBloc>().validateEmail,
                ),
                const SizedBox(height: 24),
                const TitleForm(title: 'Kata Sandi'),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: context.read<LoginBloc>().password,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    fillColor: const Color(0xFFE5F2FF),
                    filled: true,
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    hintText: 'Kata Sandi',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
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
                  obscureText: context.read<LoginBloc>().showPass,
                  validator: context.read<LoginBloc>().validatePassword,
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ForgotScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Lupa Kata Sandi ?',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (context.read<LoginBloc>().isEnableButton) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 45),
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () =>
                            context.read<LoginBloc>().add(SubmitLogin()),
                        child: const Text("Masuk"),
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
                      child: const Text("Masuk"),
                    );
                  },
                ),
                const SizedBox(height: 10),
              ],
            );
          },
        ),
      ),
    );
  }
}
