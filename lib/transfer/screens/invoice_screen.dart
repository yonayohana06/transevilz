import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:transevilz/app/app.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String va = '9999-5678-0033-1121-314';
    // This function is triggered when the copy icon is pressed
    void copyToClipboard() {
      Clipboard.setData(ClipboardData(text: va));
      Fluttertoast.showToast(
        msg: 'Copied to clipboard',
        backgroundColor: Colors.white,
        textColor: Colors.grey[800],
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
      );
      // ScaffoldMessenger.of(context).showSnackBar(
      //   const SnackBar(
      //     content: Text('Copied to clipboard'),
      //   ),
      // );
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(vertical: 20),
                child: Image.asset(
                  "assets/icon/icon_success.png",
                  height: 110,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 30),
                child: Column(
                  children: [
                    const Text(
                      "Selamat Dinda Salsabila,\n Proses anda berhasil",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Selesaikan Pembayaran sebelum",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "23 Jam 30 Menit 10 Detik",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(24, 0, 24, 30),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.5,
                    color: Colors.green,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
                child: Column(
                  children: [
                    _titleInvoice('Nama Penerima'),
                    _descInvoice('Aurora Nugroho'),
                    _titleInvoice('Jenis Bank'),
                    _descInvoice('BCC Bank'),
                    _titleInvoice('Tipe Transaksi'),
                    _descInvoice('IDR ke IDR'),
                    _titleInvoice('No. Rekening'),
                    _descInvoice('1234-5678-9101-1121-314'),
                    _titleInvoice('Virtual Akun'),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          va,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          child: const Icon(
                            FeatherIcons.copy,
                            size: 20.0,
                          ),
                          onTap: () => copyToClipboard(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Text(
                      "Total",
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 10.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      "1.000.000 IDR",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.fromLTRB(24, 10, 24, 20),
          height: 90,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        fixedSize: const Size(0, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const MainMenu(),
                          ),
                          (route) => false,
                        );
                      },
                      child: const Text("kembali Ke Beranda"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _titleInvoice(String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.blueGrey[300],
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _descInvoice(String desc) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        desc,
        style: TextStyle(
          color: Colors.grey[800],
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
