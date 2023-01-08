import 'package:flutter/material.dart';
import 'package:transevilz/app/app.dart';
import 'package:transevilz/app/transaction/transaction.dart';
import 'package:transevilz/forgot/forgot.dart';
import 'package:transevilz/transfer/transfer.dart';

class PinTransaction extends StatefulWidget {
  const PinTransaction({super.key});

  @override
  State<PinTransaction> createState() => _PinTransactionState();
}

class _PinTransactionState extends State<PinTransaction> {
  final pinLength = 6;

  final pin = TextEditingController();

  String pinDummy = '123456';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const ButtonApp(
              title: 'Masukkan Pin Evilz',
            ),
            Column(
              children: [
                const SizedBox(height: 80),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  height: 46,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    readOnly: true,
                    controller: pin,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      contentPadding: EdgeInsets.all(10),
                      fillColor: Color(0xFFE5F2FF),
                      filled: true,
                      hintStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: 'Masukkan 6 digit Pin Evilz',
                    ),
                    obscureText: true,
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(
                    top: 10,
                    bottom: 50,
                    left: 24,
                    right: 24,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ForgotScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Lupa Pin Evilz ?',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            PinNumpad(
              onChanged: (String value) {
                if (value == 'hapus') {
                  _deleteLastChar();
                }
                if (pin.text.length < pinLength) {
                  if (value != 'hapus') {
                    setState(() {
                      pin.text += value;
                    });
                  }
                  if (pin.text == pinDummy) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => InvoiceScreen()),
                      (route) => false,
                    );
                  }
                  if (pin.text.length == pinLength && pin.text != pinDummy) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Pin Salah'),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                }
              },
            )
          ],
        ),
      ),
    );
  }

  void _deleteLastChar() {
    // print('Semua karakter: $_otpValue');
    // print('Karakter terakhir sekarang: ${_otpValue.split('').last}');
    if (pin.text.isNotEmpty) {
      final split = pin.text.split('');
      split.removeLast();
      final join = split.join('');
      // print('Nilai setelah di olah: $join');
      setState(() {
        pin.text = join;
      });
    }
  }

  // String formatTime(int seconds) {
  //   final duration = Duration(seconds: _counter).toString();
  //   final firstSplit = duration.split('.').first;
  //   final removeFirstDigit = firstSplit.split(':')..removeAt(0);
  //   final cleanTimer = removeFirstDigit.join(':');
  //   return cleanTimer;
  // }
}
