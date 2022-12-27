import 'package:flutter/material.dart';
import 'package:transevilz/register/screens/otp.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  bool isButtonActive = false;

  final negaraController = TextEditingController();

  final noHPController = TextEditingController();

  bool checkButton() {
    isButtonActive = negaraController.text.isEmpty || noHPController.text.isEmpty
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
              alignment: Alignment.bottomCenter,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 152),
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Image.asset(
                        'assets/images/firstscreenpic.png',
                        height: 330,
                        width: 340,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 64, bottom: 41),
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
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
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
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
                                  child: TextFormField(
                                    textInputAction: TextInputAction.next,
                                    controller: negaraController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      filled: true,
                                      fillColor: const Color(0xFFF1F7FF),
                                      hintText: 'Pilih negara',
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
                                const SizedBox(height: 41),
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
                                SizedBox(height: 53),
                                Container(
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
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        )
    );
  }
}
