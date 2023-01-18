import 'package:flutter/material.dart';
import 'package:transevilz/history/widget/reuse_app_bar_history.dart';

class BuktiTransfer extends StatelessWidget {
  const BuktiTransfer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 356,
              decoration: BoxDecoration(
                color: Color(0xFF2075F3),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 60),
                  Text(
                    'Transaksi anda\nDalam proses',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 109),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: Image.asset('assets/history/receipt.png'),
                  )
                ],
              ),
            ),
            ReuseAppBarHistory(title: ''),
          ],
        ),
      ),
    );
  }
}
