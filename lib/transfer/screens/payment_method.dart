import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:transevilz/app/app.dart';
import 'package:transevilz/login/login.dart';
import 'package:transevilz/transfer/transfer.dart';

class PaymentMethod extends StatelessWidget {
  PaymentMethod({super.key});

  final _controller = TextEditingController();
  final List<String> items = [
    'BCA',
    'BNI',
    'BRI',
    'CIMB Niaga',
    'Mandiri',
  ];

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
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const SizedBox(height: 55),
                      Container(
                        // margin: const EdgeInsets.symmetric(horizontal: 24.0),
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
                                  "IDR ke IDR",
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
                            const Text(
                              "1.000.000 IDR",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(
                        "Metode Pembayaran",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 30),
                      TitleForm(title: 'Pilih Bank'),
                      SizedBox(
                        height: 46,
                        child: TextFormField(
                          readOnly: true,
                          controller: _controller,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                            ),
                            contentPadding: const EdgeInsets.all(10),
                            fillColor: const Color(0xFFE5F2FF),
                            filled: true,
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                            hintText: 'Bank',
                            suffixIcon: PopupMenuButton<String>(
                              icon: Icon(FeatherIcons.chevronDown),
                              onSelected: (String value) {
                                _controller.text = value;
                              },
                              itemBuilder: (context) {
                                return items
                                    .map<PopupMenuItem<String>>((String value) {
                                  return PopupMenuItem(
                                    child: Text(value),
                                    value: value,
                                  );
                                }).toList();
                              },
                              position: PopupMenuPosition.under,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
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
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        fixedSize: const Size(0, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {},
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
