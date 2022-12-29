import 'package:flutter/material.dart';
import 'package:transevilz/register/widget/checkbox.dart';
import 'package:transevilz/register/widget/dialog.dart';
import 'package:transevilz/register/widget/reuse_app_bar.dart';

class RegisterProfileForm extends StatefulWidget {
  RegisterProfileForm({Key? key}) : super(key: key);

  @override
  State<RegisterProfileForm> createState() => _RegisterProfileFormState();
}

class _RegisterProfileFormState extends State<RegisterProfileForm> {
  bool checkBox = false;
  nationality? _kewarganegaraan = nationality.wni;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 64, bottom: 126),
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
                            'Email',
                            style: TextStyle(
                              letterSpacing: -0.96,
                              height: 1.315,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              color: Colors.black,
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
                            hintText: 'Email',
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
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Text(
                            'Kewarganegaraan',
                            style: TextStyle(
                              letterSpacing: -0.96,
                              height: 1.315,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              color: Colors.black,
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
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile(
                              value: 1,
                              groupValue: null,
                              onChanged: (index) {

                              },
                              title: Text(
                                'WNI',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'DM Sans',
                                    color: Color(0xFF3A3A3A)
                                ),
                              ),
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              value: 1,
                              groupValue: null,
                              onChanged: (index) {

                              },
                              title: Text(
                                'WNA',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'DM Sans',
                                    color: Color(0xFF3A3A3A)
                                ),
                              ),
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: const [
                          Text(
                            'Tipe Dokumen',
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
                            hintText: 'Pilih Tipe Dokumen',
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
                      const SizedBox(height: 30),
                      Row(
                        children: const [
                          Text(
                            'Nomor Dokumen',
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
                            hintText: 'Masukan no dokumen',
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
                      const SizedBox(height: 30),
                      Row(
                        children: const [
                          Text(
                            'Nama Depan',
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
                            hintText: 'Nama depan',
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
                      const SizedBox(height: 30),
                      Row(
                        children: const [
                          Text(
                            'Nama Belakang',
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
                            hintText: 'Nama Belakang',
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
                      const SizedBox(height: 30),
                      Row(
                        children: const [
                          Text(
                            'Tempat Lahir',
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
                            hintText: 'Tempat Lahir',
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
                      const SizedBox(height: 30),
                      Row(
                        children: const [
                          Text(
                            'Tanggal Lahir',
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
                            hintText: 'mm/dd/yyyy',
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
                      const SizedBox(height: 30),
                      Row(
                        children: const [
                          Text(
                            'Alamat',
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
                      TextFormField(
                        style: TextStyle(fontSize: 12),
                        maxLines: 6,
                        textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF1F7FF),
                            hintText: 'Alamat',
                            hintStyle: const TextStyle(
                              letterSpacing: -0.06,
                              height: 1.315,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              fontFamily: 'DM Sans',
                              color: Color(0xFF929292),
                            ),
                            contentPadding: EdgeInsets.only(top: 15, left: 12),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Text(
                            'Kewarganegaraan',
                            style: TextStyle(
                              letterSpacing: -0.96,
                              height: 1.315,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              fontFamily: 'DM Sans',
                              color: Colors.black,
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
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile(
                              value: 1,
                              groupValue: null,
                              onChanged: (index) {

                              },
                              title: Text(
                                'Laki-laki',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'DM Sans',
                                    color: Color(0xFF3A3A3A)
                                ),
                              ),
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                          Expanded(
                            child: RadioListTile(
                              value: 1,
                              groupValue: null,
                              onChanged: (index) {

                              },
                              title: Text(
                                'Perempuan',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'DM Sans',
                                  color: Color(0xFF3A3A3A)
                                ),
                              ),
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: const [
                          Text(
                            'Kata sandi',
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
                          style: TextStyle(fontSize: 12),
                          textInputAction: TextInputAction.go,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF1F7FF),
                            hintText: 'Kata sandi',
                            hintStyle: const TextStyle(
                              letterSpacing: -0.06,
                              height: 1.315,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              fontFamily: 'DM Sans',
                              color: Color(0xFF929292),
                            ),
                            contentPadding: EdgeInsets.only(left: 10)
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        children: const [
                          Text(
                            'Konfirmasi kata sandi',
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
                          style: TextStyle(fontSize: 12),
                          textInputAction: TextInputAction.go,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFF1F7FF),
                            hintText: 'Konfirmasi kata sandi',
                            hintStyle: const TextStyle(
                              letterSpacing: -0.06,
                              height: 1.315,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              fontFamily: 'DM Sans',
                              color: Color(0xFF929292),
                            ),
                            contentPadding: EdgeInsets.only(left: 10)
                          ),
                        ),
                      ),
                      SizedBox(height: 36.5),
                      Container(
                        margin: EdgeInsets.only(left: 15, bottom: 150),
                        child: CheckBoxWidget(
                          value: checkBox,
                          onpress: () {
                            setState(() {
                              checkBox=!checkBox;
                            });
                          },
                        ),
                      )
                    ],
                  ),
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
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => SuccessDialog(
                                image: Image(
                                  image: AssetImage(
                                      'assets/images/success.png',
                                  ),
                                ),
                                status: 'Cek email anda untuk melakukan aktivasi akun',
                                buttonlabel: 'Cek Email Sekarang',
                              ),
                            );
                          },
                          child: const Text(
                            'Kirim',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
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

enum nationality {
  wni,
  wna,
}
