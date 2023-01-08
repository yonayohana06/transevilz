import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transevilz/app/app.dart';
import 'package:transevilz/transfer/transfer.dart';

class TransferScreen extends StatefulWidget {
  const TransferScreen({super.key});

  @override
  State<TransferScreen> createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  final amount = TextEditingController();
  final key = GlobalKey<FormState>();

  String admin = '5000';
  num total = 0;

  void hitung() {
    if (amount.text.isNotEmpty) {
      num count = int.parse(amount.text) + int.parse(admin);
      setState(() {
        total = count;
      });
    }
    if (amount.text.isEmpty) {
      setState(() {
        total = 0;
      });
    }
  }

  @override
  void initState() {
    amount.addListener(() {
      hitung();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: key,
        child: SafeArea(
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
                          controller: amount,
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
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10)
                          ]),
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
              Text(
                "$total IDR",
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
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
              Text(
                "$total IDR",
                style: const TextStyle(
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
                      builder: (context) => RecipientScreen(total: total),
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
