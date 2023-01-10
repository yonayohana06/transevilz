import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:transevilz/app/app.dart';
import 'package:transevilz/transfer/transfer.dart';

class TransferInter extends StatefulWidget {
  const TransferInter({super.key});

  @override
  State<TransferInter> createState() => _TransferInterState();
}

class _TransferInterState extends State<TransferInter> {
  final key = GlobalKey<FormState>();
  final amount = TextEditingController();
  var amount2 = TextEditingController();
  String admin = '100000';
  num total = 0;

  void hitung() {
    if (amount.text.isNotEmpty) {
      num count = int.parse(amount.text) + int.parse(admin);
      num exchange = int.parse(amount.text) / 15000;
      setState(() {
        total = count;
        amount2.text = exchange.toStringAsFixed(1);
      });
    }
    if (amount.text.isEmpty) {
      setState(() {
        total = 0;
        amount2.text = '';
      });
    }
  }

  // void hitungUSD() {
  //   if (amount2.text.isNotEmpty && amount.text.isEmpty) {
  //     num count = int.parse(amount2.text) * 15000;
  //     setState(() {
  //       amount.text = count.toString();
  //     });
  //   }
  // }

  @override
  void initState() {
    amount.addListener(() {
      hitung();
    });
    // amount2.addListener(() {
    //   hitungUSD();
    // });
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
                      width: 60,
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
                          LengthLimitingTextInputFormatter(10),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(90, 0, 24, 0),
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  height: 26,
                  child: Icon(
                    Icons.import_export_sharp,
                    color: Colors.grey[600],
                    size: 20.0,
                  ),
                ),
              ),
              Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 60,
                      decoration: const BoxDecoration(
                        color: Color(0xFFD8F0FF),
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(10),
                        ),
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/icon/flag_usa.png",
                          ),
                          scale: 4,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: amount2,
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
                          hintText: '',
                        ),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(7),
                        ],
                        readOnly: true,
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
                      "Nilai kurs saat ini",
                      style: TextStyle(
                        color: Color(0xFF98A5D3),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "15.000 IDR",
                      style: TextStyle(
                        color: Color(0xFF98A5D3),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
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
                      "100.000 IDR",
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
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => RecipientScreen(),
                  //   ),
                  // );
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
