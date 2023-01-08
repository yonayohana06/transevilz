import 'package:flutter/material.dart';
import 'package:transevilz/app/app.dart';
import 'package:transevilz/transfer/transfer.dart';

class RecipientScreen extends StatelessWidget {
  const RecipientScreen({super.key, required this.total});

  final num total;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ButtonApp(
              title: 'Akun Bank',
              color: Colors.blue,
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: ScrollController(),
                child: Column(
                  children: [
                    const SizedBox(height: 55),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24.0),
                      padding: const EdgeInsets.all(20),
                      height: 120,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF5638F0),
                            Color(0xFF20BDFF),
                            Colors.green,
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/icon/flag_indonesia.png",
                                height: 16.0,
                                fit: BoxFit.fill,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                "IDR",
                                style: TextStyle(
                                  color: Color(0xFF3A3A3A),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Total Transaksi",
                            style: TextStyle(
                              color: Color.fromARGB(255, 194, 194, 194),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "$total IDR",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    FormTransfer()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          height: 130,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        fixedSize: const Size(0, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        side: const BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Atur Ulang",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PaymentMethod(total: total),
                          ),
                        );
                      },
                      child: const Text("Selanjutnya"),
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
}
