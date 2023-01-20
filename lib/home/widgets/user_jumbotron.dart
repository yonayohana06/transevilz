import 'package:flutter/material.dart';
import 'package:transevilz/home/home.dart';
import 'package:transevilz/transfer/transfer.dart';

class UserJumbotron extends StatelessWidget {
  const UserJumbotron({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 335 / 300,
      child: Stack(
        children: [
          _View(),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Transaction(),
          ),
        ],
      ),
    );
  }
}

class _View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
        color: Colors.blue,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            blurStyle: BlurStyle.normal,
            color: const Color(0xFFBCC8E7).withOpacity(0.4),
            offset: const Offset(0, 0),
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const UserInfo(),
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: const Text(
              "Transaksi Terakhir :",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Flexible(flex: 1, child: UserHistory()),
        ],
      ),
    );
  }
}

class Transaction extends StatelessWidget {
  const Transaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 45),
                backgroundColor: const Color(0xFFFFAD0E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TransferScreen(
                      type: TypeTransaction.local,
                    ),
                  ),
                );
              },
              child: const Text(
                "Transfer lokal",
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width, 45),
                backgroundColor: const Color(0xFFFFAD0E),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TransferInter(
                      type: TypeTransaction.international,
                    ),
                  ),
                );
              },
              child: const Text(
                "Transfer Internasional",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
