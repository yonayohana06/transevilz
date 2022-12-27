import 'package:flutter/material.dart';
import 'package:transevilz/register/widget/reuse_app_bar.dart';

class RegisterProfileForm extends StatelessWidget {
  const RegisterProfileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 64, bottom: 29),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F7FF),
                        shape: BoxShape.circle
                      ),
                      height: 60,
                      width: 60,
                      child: Center(
                        child: Image.asset(
                          'assets/images/user-plus.png',
                          height: 28.8,
                          width: 28.8,
                        ),
                      ),
                    ),
                    Text(
                      'Tambah gambar',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: 'DM Sans',
                        color: Color(0xFF7A7A7A),
                        letterSpacing: 0.096,
                        height: 1.315,
                      ),
                      textAlign: TextAlign.center,
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
                      child: TextFormField(
                        textInputAction: TextInputAction.next,
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
                  ],
                ),
              ),
            ),
            ReuseAppBar(title: 'Registrasi'),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              fixedSize: Size(MediaQuery.of(context).size.width, 48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              )
                          ),
                          onPressed: () {},
                          child: const Text(
                            'Kirim',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
