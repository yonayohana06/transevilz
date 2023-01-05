import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transevilz/register/bloc/register_bloc.dart';
import 'package:transevilz/register/screens/register_profile_form.dart';
import 'package:transevilz/register/widget/reuse_app_bar.dart';

class OtpPrep extends StatelessWidget {
  const OtpPrep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: OtpScreen(),
    );
  }
}


class OtpScreen extends StatefulWidget {
  OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  Timer? timerCount;
  final time = (60);
  late int timeLeft;

  @override
  void initState() {
    timeLeft = time;
    super.initState();
    timerCount = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        timeLeft--;
      });
      if(timeLeft==0){
        return timerCount!.cancel();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ReuseAppBar(
                title: '',
                onpress: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
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
                  style: TextStyle(
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
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Belum dapat kode otp?',
                          style: TextStyle(
                            color: Color(0xFF7A7A7A),
                            fontSize: 12,
                          ),
                        ),
                        timeLeft == 0
                            ? TextSpan(
                            text: ' KIRIM ULANG KODE OTP',
                            style: TextStyle(
                                color: Color(0xFF2ACA10),
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                            )
                        )
                            : TextSpan(
                          text: '',
                          style: TextStyle(
                              color: Color(0xFF2ACA10),
                              fontSize: 12,
                              fontWeight: FontWeight.w600
                          ),
                        )
                      ]
                  ),
                ),
              ),
              Expanded(
                child: OtpKeyboard(
                  changed: (String value) {
                    if(value == 'del') {
                      if(context.read<RegisterBloc>().codeSubmit.text.isEmpty) {
                        return null;
                      }
                      final deleting = context.read<RegisterBloc>().codeSubmit.text.split('');
                      deleting.removeLast();
                      final join = deleting.join('');
                      context.read<RegisterBloc>().codeSubmit.text = join;
                    }
                    else {
                      if(context.read<RegisterBloc>().codeSubmit.text.length < 6) {
                        context.read<RegisterBloc>().codeSubmit.text += value;
                      }
                      if(context.read<RegisterBloc>().codeSubmit.text==context.read<RegisterBloc>().otpDummy) {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterProfileReq()));
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
          margin: EdgeInsets.only(top: 40, left: 37, right: 37),
          child: GridView(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                mainAxisExtent: 75,
                childAspectRatio: 2/1
            ),
            children: [
              OtpButton(
                onPressing: () {
                  changed('1');
                },
                widget: Text(
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
                widget: Text(
                  '2',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2075F3),
                      fontFamily: 'Montserrat'
                  ),
                ),
              ),
              OtpButton(
                onPressing: () {
                  changed('3');
                },
                widget: Text(
                  '3',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2075F3),
                      fontFamily: 'Montserrat'
                  ),
                ),
              ),
              OtpButton(
                onPressing: () {
                  changed('4');
                },
                widget: Text(
                  '4',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2075F3),
                      fontFamily: 'Montserrat'
                  ),
                ),
              ),
              OtpButton(
                onPressing: () {
                  changed('5');
                },
                widget: Text(
                  '5',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2075F3),
                      fontFamily: 'Montserrat'
                  ),
                ),
              ),
              OtpButton(
                onPressing: () {
                  changed('6');
                },
                widget: Text(
                  '6',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2075F3),
                      fontFamily: 'Montserrat'
                  ),
                ),
              ),
              OtpButton(
                onPressing: () {
                  changed('7');
                },
                widget: Text(
                  '7',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2075F3),
                      fontFamily: 'Montserrat'
                  ),
                ),
              ),
              OtpButton(
                onPressing: () {
                  changed('8');
                },
                widget: Text(
                  '8',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2075F3),
                      fontFamily: 'Montserrat'
                  ),
                ),
              ),
              OtpButton(
                onPressing: () {
                  changed('9');
                },
                widget: Text(
                  '9',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2075F3),
                      fontFamily: 'Montserrat'
                  ),
                ),
              ),
              SizedBox(),
              OtpButton(
                onPressing: () {
                  changed('0');
                },
                widget: Text(
                  '0',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF2075F3),
                      fontFamily: 'Montserrat'
                  ),
                ),
              ),
              OtpButton(
                onPressing: () {
                  changed('del');
                },
                widget: Icon(
                  Icons.backspace_outlined, color: Color(0xFF2075F3),
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
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: 55,
            width: 55,
            decoration: const BoxDecoration(
              color: Color(0xFFF1F7FF),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                    color: Color.fromRGBO(32, 117, 243, 0.15),
                    blurRadius: 10.0,
                    spreadRadius: 0
                ),
              ],
            ),
            child: Center(
              child: widget,
            )
        )
    );
  }
}