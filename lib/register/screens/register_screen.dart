import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:transevilz/register/bloc/register_bloc.dart';
import 'package:transevilz/register/screens/otp.dart';
import 'package:transevilz/register/widget/dropdownform.dart';
import 'package:transevilz/register/widget/reuse_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterRequire extends StatelessWidget {
  const RegisterRequire({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: RegisterScreen(),
    );
  }
}


class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: BlocBuilder<RegisterBloc, RegisterState>(
              builder: (context, state) {
                if (context.read<RegisterBloc>().submitValidator) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        fixedSize: Size(MediaQuery.of(context).size.width, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        )
                    ),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return OtpPrep();
                      }));
                    },
                    child: const Text(
                      'Kirim',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  );
                }
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      fixedSize: Size(MediaQuery.of(context).size.width, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )
                  ),
                  onPressed: null,
                  child: Text(
                    'Kirim',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF3A3A3A),
                    ),
                  ),
                );
              },
            ),
          )
        ),
        body: SafeArea(
          child: Stack(
            children: [
              ReuseAppBar(title: ''),
              Container(
                margin: EdgeInsets.only(top: 36, left: 24, right: 24),
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Selamat Datang di\nTransEvilz',
                        style: TextStyle(
                          letterSpacing: 0.44,
                          height: 1.319,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'DM Sans',
                          color: Color(0xFF2075F3),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 3.5),
                      Text(
                        'Jika Anda ingin bergabung, lakukan register\nterlebih dahulu',
                        style: TextStyle(
                          letterSpacing: 0.24,
                          height: 1.303,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'DM Sans',
                          color: Color(0xFF929292),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Container(
                        child: Image.asset(
                          'assets/images/firstscreenpic.png',
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: const [
                          Text(
                            'No.Hp',
                            style: TextStyle(
                                letterSpacing: -0.96,
                                height: 1.315,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontFamily: 'DM Sans',
                                color: Colors.black
                            ),
                          ),
                          SizedBox(width: 2),
                          Text(
                            '*',
                            style: TextStyle(
                              letterSpacing: -0.06,
                              height: 1.315,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              color: Color(0xFFDC3328),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 3),
                      Form(
                        key: context.read<RegisterBloc>().formkey,
                        onChanged: () {

                        },
                        child: Stack(
                          children: [
                            TextField(
                              onChanged: (_) {
                                context.read<RegisterBloc>().add(PhoneNumValidateEvent());
                              },
                              onTap: () {
                                context.read<RegisterBloc>().add(PhoneNumValidateEvent());
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(20),
                              ],
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.go,
                              controller: context.read<RegisterBloc>().phoneNumber,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                filled: true,
                                fillColor: const Color(0xFFF1F7FF),
                                hintText: 'Masukkan no.hp',
                                hintStyle: const TextStyle(
                                  letterSpacing: -0.06,
                                  height: 1.315,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  fontFamily: 'DM Sans',
                                  color: Color(0xFF929292),
                                ),
                                contentPadding: EdgeInsets.only(left: 60),
                              ),
                            ),
                            Container(
                              height: 48,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                ),
                                color: Color(0xFFEAF3FF)
                              ),
                              width: 50,
                              child: Center(
                                child: Text(
                                  '+62',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: 'DM Sans',
                                      color: Color(0xFF2075F3)
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 12),
                      BlocBuilder<RegisterBloc, RegisterState>(
                        builder: (context, state) {
                          print(state);
                          if(state is PhoneNumEmptyState) {
                            return Text(
                              'Anda harus mengisi bagian ini',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFDC3328)
                              ),
                            );
                          }
                          if(state is PhoneNumFormatState) {
                            return Text(
                              'Format no.HP salah',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFFDC3328)
                              ),
                            );
                          }
                          return Text('');
                        },
                      ),
                      SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
