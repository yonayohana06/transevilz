import 'package:flutter/material.dart';
import 'package:transevilz/register/screens/otp.dart';
import 'package:transevilz/register/widget/dropdownform.dart';
import 'package:transevilz/register/widget/reuse_app_bar.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isButtonActive = false;

  String? negara;

  List<String> dropdown = ['Australia', 'Jepang', 'Indonesia', 'Singapore', 'United States of America'];

  final negaraController = TextEditingController();

  final noHPController = TextEditingController();

  bool checkButton() {
    isButtonActive = noHPController.text.isEmpty
        ? false
        : true;
    return isButtonActive;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Stack(
              children: [
                ReuseAppBar(title: ''),
                Container(
                  margin: EdgeInsets.only(top: 36, left: 24, right: 24),
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    child: Column(
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
                          margin: EdgeInsets.symmetric(horizontal: 25),
                          child: Image.asset(
                            'assets/images/firstscreenpic.png',
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              'Negara',
                              style: TextStyle(
                                  letterSpacing: -0.96,
                                  height: 1.315,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  fontFamily: 'DM Sans',
                                  color: Colors.black
                              ),
                            ),
                            const SizedBox(width: 2),
                            const Text(
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
                        SizedBox(
                          height: 39,
                          child: EvilDropDown(
                            buttonWidth: MediaQuery.of(context).size.width,
                            dropdownWidth: MediaQuery.of(context).size.width,
                            hint: 'Pilih negara',
                            value: negara,
                            dropdownItems: dropdown,
                            onChanged: (value) {
                              setState(() {
                                negara = value as String;
                              });
                            },
                          ),
                          // child: DropdownButtonFormField(
                          //   decoration: InputDecoration(
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.circular(12)
                          //     ),
                          //     contentPadding: EdgeInsets.zero
                          //   ),
                          //   hint: Text(
                          //     'Pilih negara',
                          //     style: TextStyle(fontSize: 12),
                          //   ),
                          //   value: negara,
                          //   items: dropdown.map((String val) {
                          //     return DropdownMenuItem<String>(
                          //       value: val,
                          //       child: Text(val),
                          //     );
                          //   }).toList(),
                          //   onChanged: (newVal) {
                          //     setState(() {
                          //       negara = newVal;
                          //     });
                          //   },
                          // ),
                        ),
                        const SizedBox(height: 30),
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
                        SizedBox(
                          height: 39,
                          child: TextFormField(
                            textInputAction: TextInputAction.go,
                            controller: noHPController,
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
                            ),
                          ),
                        ),
                        SizedBox(height: 46),
                        Container(
                            margin: EdgeInsets.only(bottom: 100),
                            child: checkButton()
                                ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue,
                                  fixedSize: Size(MediaQuery.of(context).size.width, 48),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  )
                              ),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return const OtpScreen();
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
                            )
                                : GestureDetector(
                              child: Container(
                                  height: 48,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF609FFF),
                                      borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Kirim',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFFD9D9D9),
                                      ),
                                    ),
                                  )
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
