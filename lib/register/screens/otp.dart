import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:transevilz/register/register.dart';

class OtpPrep extends StatelessWidget {
  const OtpPrep({Key? key, required this.noHP}) : super(key: key);

  final String noHP;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: OtpScreen(noHP: noHP),
    );
  }
}

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key, required this.noHP}) : super(key: key);
  final String noHP;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  Timer? timerCount;
  var time = (60);
  late int timeLeft;

  @override
  void initState() {
    print('no hp: ${widget.noHP}');
    timeLeft = time;
    super.initState();
    timerCount = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        return;
      }
      setState(() {
        timeLeft--;
      });
      if (timeLeft == 0) {
        return timerCount!.cancel();
      }
    });
  }

  void kirimUlang() {
    timeLeft = time;
    timerCount = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        return;
      }
      setState(() {
        timeLeft--;
      });
      if (timeLeft == 0) {
        return timerCount!.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ReuseAppBar(
                title: '',
                onpress: () => Navigator.pop(context),
              ),
              const SizedBox(height: 10),
              const Text(
                'Verifikasi Kode OTP',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'DM Sans',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              const Text(
                'Masukkan kode verifikasi '
                'yang telah dikirim pada No.Hp '
                'yang telah anda\ndaftarkan '
                'sebelumnya',
                style: TextStyle(
                  fontSize: 9,
                  color: Color(0xFF7A7A7A),
                  fontWeight: FontWeight.w400,
                  fontFamily: 'DM Sans',
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.center,
                child: Text(
                  otpTimer(timeLeft),
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF2ACA10),
                    fontWeight: FontWeight.w700,
                    fontFamily: 'DM Sans',
                  ),
                ),
              ),
              const SizedBox(height: 34),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                height: 39,
                child: TextFormField(
                  readOnly: true,
                  controller: context.read<RegisterBloc>().codeSubmit,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none),
                    hintText: 'Masukkan 6 digit Kode OTP',
                    hintStyle: const TextStyle(
                      fontSize: 12,
                    ),
                    filled: true,
                    fillColor: const Color(0xFFF1F7FF),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Belum dapat kode otp? ',
                        style: TextStyle(
                            color: Color(0xFF7A7A7A),
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      timeLeft == 0
                          ? GestureDetector(
                              onTap: () {
                                if (timeLeft == 0) {
                                  kirimUlang();
                                  context
                                      .read<RegisterBloc>()
                                      .codeSubmit
                                      .clear();
                                }
                              },
                              onDoubleTap: () {},
                              onTapUp: (v) {},
                              onTapDown: (v) {},
                              onTapCancel: () {},
                              onLongPress: () {},
                              onDoubleTapCancel: () {},
                              onHorizontalDragCancel: () {},
                              onLongPressCancel: () {},
                              onLongPressStart: (v) {},
                              onLongPressUp: () {},
                              onPanCancel: () {},
                              onSecondaryLongPress: () {},
                              onSecondaryLongPressCancel: () {},
                              onSecondaryLongPressStart: (v) {},
                              onSecondaryLongPressUp: () {},
                              onSecondaryTap: () {},
                              onSecondaryTapCancel: () {},
                              onTertiaryLongPress: () {},
                              onTertiaryLongPressCancel: () {},
                              onTertiaryLongPressUp: () {},
                              onTertiaryTapCancel: () {},
                              onVerticalDragCancel: () {},
                              child: const Text('KIRIM ULANG KODE OTP',
                                  style: TextStyle(
                                      color: Color(0xFF2ACA10),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600)),
                            )
                          : const Text(''),
                    ],
                  )),
              Expanded(
                child: OtpKeyboard(
                  changed: (String value) async {
                    if (value == 'del') {
                      if (context
                          .read<RegisterBloc>()
                          .codeSubmit
                          .text
                          .isEmpty) {
                        return;
                      }
                      final deleting = context
                          .read<RegisterBloc>()
                          .codeSubmit
                          .text
                          .split('');
                      deleting.removeLast();
                      final join = deleting.join('');
                      context.read<RegisterBloc>().codeSubmit.text = join;
                    } else {
                      if (context.read<RegisterBloc>().codeSubmit.text.length <
                          6) {
                        context.read<RegisterBloc>().codeSubmit.text += value;
                      }
                      if (context.read<RegisterBloc>().codeSubmit.text ==
                              context.read<RegisterBloc>().otpDummy &&
                          timeLeft != 0) {
                        try {
                          final Uri backOfficeUrl = Uri.parse(
                              'https://red-gifted-squid.cyclic.app/api/v1/otp_verification');
                          Map<String, String> headerSet = {
                            "Accept": "application/json",
                            "Content-Type": "application/json;charset=UTF-8",
                          };
                          Map<String, dynamic> otpMatching = {
                            "otp_code": int.parse(
                                context.read<RegisterBloc>().codeSubmit.text)
                          };
                          http.Response response = await context
                              .read<RegisterBloc>()
                              .httpClient
                              .post(
                                backOfficeUrl,
                                headers: headerSet,
                                body: jsonEncode(otpMatching),
                              );
                          // print(response.body);
                          // print(response.statusCode);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) {
                              return RegisterProfileReq(
                                  numberPhone: widget.noHP);
                            }),
                          );
                        } catch (e) {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) => DialogWidget(
                              image:
                                  Image.asset('assets/images/disconnect.png'),
                              status: const Text(
                                'Oops! Koneksi internet anda tidak stabil, muat ulang halaman',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  fontFamily: 'DM Sans',
                                  color: Color(0xFFDC3328),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              buttonlabel: 'Coba Lagi',
                              onpress: () {
                                Navigator.pop(context);
                              },
                            ),
                          );
                        }
                        context.read<RegisterBloc>().codeSubmit.clear();
                      }
                      if (context.read<RegisterBloc>().codeSubmit.text ==
                              context.read<RegisterBloc>().otpDummy &&
                          timeLeft == 0) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => DialogWidget(
                            image: Image.asset('assets/images/runout.png'),
                            status: const Text(
                              'Oops! Waktu anda Habis',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'DM Sans',
                                color: Color(0xFFDC3328),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            buttonlabel: 'Coba Lagi',
                            onpress: () {
                              Navigator.pop(context);
                            },
                          ),
                        );
                        context.read<RegisterBloc>().codeSubmit.clear();
                      }
                      if (context.read<RegisterBloc>().codeSubmit.text.length ==
                              6 &&
                          context.read<RegisterBloc>().codeSubmit.text !=
                              context.read<RegisterBloc>().otpDummy &&
                          timeLeft == 0) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => DialogWidget(
                            image: Image.asset('assets/images/runout.png'),
                            status: const Text(
                              'Oops! Waktu anda Habis',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'DM Sans',
                                color: Color(0xFFDC3328),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            buttonlabel: 'Coba Lagi',
                            onpress: () {
                              Navigator.pop(context);
                            },
                          ),
                        );
                        context.read<RegisterBloc>().codeSubmit.clear();
                      }
                      if (context.read<RegisterBloc>().codeSubmit.text.length ==
                              6 &&
                          context.read<RegisterBloc>().codeSubmit.text !=
                              context.read<RegisterBloc>().otpDummy) {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => DialogWidget(
                            image: const Icon(
                              Icons.cancel_rounded,
                              color: Colors.red,
                              size: 80,
                            ),
                            status: const Text(
                              'Oops! Kode OTP yang anda masukan salah',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'DM Sans',
                                color: Color(0xFFDC3328),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            buttonlabel: 'Coba Lagi',
                            onpress: () {
                              Navigator.pop(context);
                              // time = 0;
                              // timeLeft = time;
                              // setState(() {
                              //   timerCount!.cancel();
                              // });
                              // time = 60;
                            },
                          ),
                        );
                        context.read<RegisterBloc>().codeSubmit.clear();
                      }
                      print(context.read<RegisterBloc>().codeSubmit.text);
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String otpTimer(int seconds) {
    final duration = Duration(seconds: timeLeft).toString();
    final split = duration.split('.').first;
    final removing = split.split(':')..removeAt(0);
    final runtime = removing.join(':');
    return runtime;
  }
}

class OtpKeyboard extends StatelessWidget {
  const OtpKeyboard({Key? key, required this.changed}) : super(key: key);
  final ValueChanged<String> changed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 40, left: 37, right: 37),
          child: GridView(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                mainAxisExtent: 75,
                childAspectRatio: 2 / 1),
            children: [
              OtpButton(
                onPressing: () {
                  changed('1');
                },
                widget: const Text(
                  '1',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2075F3),
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
              OtpButton(
                onPressing: () {
                  changed('2');
                },
                widget: const Text(
                  '2',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2075F3),
                      fontFamily: 'Montserrat'),
                ),
              ),
              OtpButton(
                onPressing: () {
                  changed('3');
                },
                widget: const Text(
                  '3',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2075F3),
                      fontFamily: 'Montserrat'),
                ),
              ),
              OtpButton(
                onPressing: () {
                  changed('4');
                },
                widget: const Text(
                  '4',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2075F3),
                      fontFamily: 'Montserrat'),
                ),
              ),
              OtpButton(
                onPressing: () {
                  changed('5');
                },
                widget: const Text(
                  '5',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2075F3),
                      fontFamily: 'Montserrat'),
                ),
              ),
              OtpButton(
                onPressing: () {
                  changed('6');
                },
                widget: const Text(
                  '6',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2075F3),
                      fontFamily: 'Montserrat'),
                ),
              ),
              OtpButton(
                onPressing: () {
                  changed('7');
                },
                widget: const Text(
                  '7',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2075F3),
                      fontFamily: 'Montserrat'),
                ),
              ),
              OtpButton(
                onPressing: () {
                  changed('8');
                },
                widget: const Text(
                  '8',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2075F3),
                      fontFamily: 'Montserrat'),
                ),
              ),
              OtpButton(
                onPressing: () {
                  changed('9');
                },
                widget: const Text(
                  '9',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2075F3),
                      fontFamily: 'Montserrat'),
                ),
              ),
              const SizedBox(),
              OtpButton(
                onPressing: () {
                  changed('0');
                },
                widget: const Text(
                  '0',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2075F3),
                      fontFamily: 'Montserrat'),
                ),
              ),
              OtpButton(
                onPressing: () {
                  changed('del');
                },
                widget: const Icon(
                  Icons.backspace_outlined,
                  color: Color(0xFF2075F3),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class OtpButton extends StatelessWidget {
  const OtpButton({Key? key, required this.widget, this.onPressing})
      : super(key: key);

  final Widget widget;
  final VoidCallback? onPressing;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        splashColor: Colors.white54,
        borderRadius: BorderRadius.circular(55),
        onTap: onPressing,
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 55,
            width: 55,
            decoration: const BoxDecoration(
              color: Color(0xFFF1F7FF),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(32, 117, 243, 0.15),
                    blurRadius: 10.0,
                    spreadRadius: 0),
              ],
            ),
            child: Center(
              child: widget,
            )));
  }
}
