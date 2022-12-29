import 'package:flutter/material.dart';
import 'package:transevilz/register/screens/register_profile_form.dart';
import 'package:transevilz/register/widget/reuse_app_bar.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              ReuseAppBar(title: ''),
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
              const Align(
                alignment: Alignment.center,
                child: Text(
                  '01:00',
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
              Expanded(
                child: Stack(
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
                            onPressing: () {},
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RegisterProfileForm(),
                                ),
                              );
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
                            widget: Icon(
                              Icons.backspace_outlined, color: Color(0xFF2075F3),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Belum dapat kode otp?',
                      style: TextStyle(
                        color: Color(0xFF7A7A7A)
                      )
                    ),
                    TextSpan(
                      text: ' KIRIM ULANG KODE OTP',
                      style: TextStyle(
                        color: Colors.green
                      )
                    )
                  ]
                ),
              ),
              SizedBox(height: 44),
            ],
          ),
        ),
      ),
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
