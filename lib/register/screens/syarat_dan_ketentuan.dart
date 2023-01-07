import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transevilz/register/bloc/register_bloc.dart';
import 'package:transevilz/register/screens/register_profile_form.dart';
import 'package:transevilz/register/screens/register_screen.dart';
import 'package:transevilz/register/widget/reuse_app_bar.dart';

class SyaratPrep extends StatelessWidget {
  const SyaratPrep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: Syarat(),
    );
  }
}


class Syarat extends StatefulWidget {
  const Syarat({Key? key}) : super(key: key);

  @override
  State<Syarat> createState() => _SyaratState();
}

class _SyaratState extends State<Syarat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 41),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(
                double.infinity,
                48,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8)
              ),
              backgroundColor: Color(0xFF2075F3)
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Ya, Saya Mengerti'),
          ),
        )
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF1F7FF),
                ),
                margin: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
                padding: EdgeInsets.only(bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 30,),
                    const Text(
                      'A.Syarat',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            '1.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 3),
                            child: const Text(
                              'TransEvilz (Mobile Banking) adalah layanan produk perbankan TransEvilz yang dapat diakses secara langsung oleh Nasabah melalui telepon seluler/handphone, baik dengan menggunakan menu yang sudah tersedia di Subscriber Identification Module (SIM) Card, dengan menggunakan media SMS atau menggunakan menu pada TransEvilz mobile dengan menggunakan media jaringan internet pada handphone dikombinasikan dengan media SMS sesuai ketentuan yang berlaku di TransEvilz.',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            '2.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 3),
                            child: const Text(
                              'TransEvilz mobile adalah aplikasi yang dapat di-download dari website resmi TransEvilz maupun media distribusi aplikasi/software resmi yang ditunjuk TransEvilz yang dimiliki oleh mobile operating system yang terdapat di handphone nasabah untuk melakukan transaksi melalui TransEvilz atau untuk memperoleh Info TransEvilz.',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text('3.'),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 3),
                            child: const Text(
                              'PIN Evilz (Personal Identification Number)  adalah nomor identifikasi pribadi bagi Nasabah yang menggunakan TransEvilz.',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            '4.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 3),
                            child: const Text(
                              'Kode Akses adalah kode pribadi bagi Nasabah yang menggunakan TransEvilz pada TransEvilz mobile.',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            '5.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 3),
                            child: const Text(
                              'Kode Transaksi adalah suatu kode yang dihasilkan oleh TransEvilz pada TransEvilz mobile untuk melakukan transaksi tarik tunai, setor tunai di ATM TransEvilz, atau transaksi di kantor cabang TransEvilz tanpa menggunakan Kartu TransEvilz.',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            '6.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 3),
                            child: const Text(
                              'Kartu Kredit TransEvilz adalah segala jenis kartu kredit yang diterbitkan oleh TransEvilz untuk Nasabah.',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            '7.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 3),
                            child: const Text(
                              'TransEvilz yang dapat diakses oleh Nasabah melalui smartphone.',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            '8.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 3),
                            child: const Text(
                              'TransEvilz adalah layanan informasi mengenai produk dan layanan TransEvilz berikut program promosinya, lokasi mesin Anjungan Tunai Mandiri (ATM) TransEvilz dan kantor cabang BCA, serta informasi lainnya terkait dengan TransEvilz.',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            '9.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 3),
                            child: const Text(
                              'Sakuku adalah uang elektronik dalam mata uang Rupiah dengan menggunakan aplikasi resmi dari TransEvilz dan berbasis server serta menggunakan nomor telepon seluler sebagai nomor rekening.',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            '10.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 3),
                            child: const Text(
                              'Kartu TransEvilz adalah kartu ATM yang diterbitkan oleh BCA yang dapat dipergunakan oleh pemegang Kartu TransEvilz untuk melakukan transaksi perbankan tertentu melalui TransEvilz dan/atau sarana lain yang ditentukan oleh TransEvilz.',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    const Text(
                      'B.Ketentuan',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            '1.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 3),
                            child: const Text(
                              'TransEvilz (Mobile Banking) adalah layanan produk perbankan TransEvilz yang dapat diakses secara langsung oleh Nasabah melalui telepon seluler/handphone, baik dengan menggunakan menu yang sudah tersedia di Subscriber Identification Module (SIM) Card, dengan menggunakan media SMS atau menggunakan menu pada TransEvilz mobile dengan menggunakan media jaringan internet pada handphone dikombinasikan dengan media SMS sesuai ketentuan yang berlaku di TransEvilz.',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            '2.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 3),
                            child: const Text(
                              'TransEvilz mobile adalah aplikasi yang dapat di-download dari website resmi TransEvilz maupun media distribusi aplikasi/software resmi yang ditunjuk TransEvilz yang dimiliki oleh mobile operating system yang terdapat di handphone nasabah untuk melakukan transaksi melalui TransEvilz atau untuk memperoleh Info TransEvilz.',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            '3.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 3),
                            child: const Text(
                              'PIN Evilz (Personal Identification Number)  adalah nomor identifikasi pribadi bagi Nasabah yang menggunakan TransEvilz.',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            '4.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 3),
                            child: const Text(
                              'Kode Akses adalah kode pribadi bagi Nasabah yang menggunakan TransEvilz pada TransEvilz mobile.',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 5),
                          child: Text(
                            '5.',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.only(left: 3),
                            child: const Text(
                              'Kode Transaksi adalah suatu kode yang dihasilkan oleh TransEvilz pada TransEvilz mobile untuk melakukan transaksi tarik tunai, setor tunai di ATM TransEvilz, atau transaksi di kantor cabang TransEvilz tanpa menggunakan Kartu TransEvilz.',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ReuseAppBar(
              title: 'Syarat & Ketentuan',
              onpress: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
