import 'package:flutter/material.dart';
import 'package:transevilz/app/app.dart';
import 'package:transevilz/transfer/transfer.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ButtonApp(
              title: 'Masukkan Nominal',
              color: Colors.blue,
            ),
            const SizedBox(height: 55),
            Container(
              height: 40,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 36,
                    decoration: const BoxDecoration(
                      color: Color(0xFFD8F0FF),
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(10),
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/icon/flag_indonesia.png",
                        ),
                        scale: 4,
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        fillColor: Color(0xFFE5F2FF),
                        filled: true,
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.horizontal(
                            right: Radius.circular(10.0),
                          ),
                        ),
                        hintText: 'IDR',
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Biaya Admin",
                    style: TextStyle(
                      color: Color(0xFF98A5D3),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "5.000 IDR",
                    style: TextStyle(
                      color: Color(0xFF98A5D3),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          height: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Uang akan terkirim satu hari setelah "
                "proses berhasil jika dibayar sebelum pukul 23:00",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Total Transaksi",
                style: TextStyle(
                  color: Color(0xFF98A5D3),
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "1.000.000 IDR",
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  fixedSize: Size(MediaQuery.of(context).size.width, 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RecipientScreen(),
                    ),
                  );
                },
                child: const Text("Selanjutnya"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
