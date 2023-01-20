import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:transevilz/history/model_data/modelJson.dart';
import 'package:transevilz/history/widget/reuse_app_bar_history.dart';
import 'package:flutter/services.dart';

class BuktiTransfer extends StatefulWidget {
  BuktiTransfer({
    super.key,
    this.recipientName,
    this.senderName,
    this.bank,
    this.typeCurrency,
    this.typeTransaction,
    this.recipientNorek,
    this.virtualAccount,
    this.total,
    this.nominal,
    this.status,
    this.adminFee,
    this.swiftNumber,
    this.transactionDate,
    this.expiredAt,
    this.isExpired,
    this.timeLeft
  });

  String? recipientName;
  String? senderName;
  String? bank;
  String? typeCurrency;
  String? typeTransaction;
  String? recipientNorek;
  String? virtualAccount;
  String? total;
  String? nominal;
  String? status;
  String? adminFee;
  String? swiftNumber;
  String? transactionDate;
  String? expiredAt;
  bool? isExpired;
  int? timeLeft;

  @override
  State<BuktiTransfer> createState() => _BuktiTransferState();
}

class _BuktiTransferState extends State<BuktiTransfer> {
  Timer? timerCount;
  late int timeLeftNow;

  @override
  void initState() {
    timeLeftNow = widget.timeLeft!;
    int seconds = (widget.timeLeft!%60);
    int minutes = (widget.timeLeft!/60).toInt();
    int minutesShowed = (minutes%60);
    int hour = (minutes/60).toInt();
    timerCount = Timer.periodic(const Duration(seconds: 1), (timer) {
      if(!mounted) {
        return null;
      };
      setState(() {
        timeLeftNow--;
      });
    });
    print(otpTimer(hour, minutesShowed, seconds));
  }
  String otpTimer(int hour, minutes, seconds) {
    return '${hour} Jam ${minutes} Menit ${seconds} Detik';
  }

  void dispose() {
    super.dispose();
  }
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 60),
                  if(widget.isExpired==false && widget.status=='In Progress')...{
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Transaksi anda\nDalam proses',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 15.5),
                        Text(
                          'Selesaikan Pembayaran sebelum',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8.5),
                        Text(
                          otpTimer((timeLeftNow/60/60).toInt(), (timeLeftNow/60%60).toInt(), timeLeftNow%60),
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                  }
                  else if(widget.isExpired==false && widget.status=='Failed')...{
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Transaksi anda\nGagal',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 15.5),
                        Text(
                          'Proses Transaksi Anda tidak Berhasil',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8.5),
                        Text(
                          'Silakan Lakukan Transaksi Ulang',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  }
                  else if(widget.isExpired==true && widget.status=='Failed')...{
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Transaksi anda\nGagal',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 15.5),
                        Text(
                          'Proses Transaksi Anda tidak Berhasil',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8.5),
                        Text(
                          'Silakan Lakukan Transaksi Ulang',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  }
                  else if(widget.isExpired==true && widget.status=='In Progress')...{
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Transaksi anda\nGagal',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 15.5),
                        Text(
                          'Proses Transaksi Anda tidak Berhasil',
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 8.5),
                        Text(
                          'Silakan Lakukan Transaksi Ulang',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.white
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  }
                  else if(widget.status=='Success')...{
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Transaksi anda\nBerhasil',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 30),
                      ],
                    )
                  },
                  SizedBox(height: 8.5),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: Stack(
                      children: [
                        Container(
                          width: 342,
                          child: Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 50),
                                child: Image.asset('assets/history/receipt.png'),
                              ),
                              if(widget.isExpired==false && widget.status=='In Progress')...{
                                Image.asset(
                                  'assets/history/uim_process.png',
                                  height: 100,
                                  width: 100,
                                ),
                              }
                              else if(widget.isExpired==false && widget.status=='Failed')...{
                                Image.asset(
                                  'assets/history/cross_icon.png',
                                  height: 100,
                                  width: 100,
                                ),
                              }
                              else if(widget.isExpired==true && widget.status=='Failed')...{
                                Image.asset(
                                  'assets/history/cross_icon.png',
                                  height: 100,
                                  width: 100,
                                ),
                              }
                              else if(widget.isExpired==true && widget.status=='In Progress')...{
                                Image.asset(
                                  'assets/history/cross_icon.png',
                                  height: 100,
                                  width: 100,
                                ),
                              }
                              else if(widget.status=='Success')...{
                                Image.asset(
                                  'assets/history/check_mark.png',
                                  height: 100,
                                  width: 100,
                                ),
                              },
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  SizedBox(height: 60),
                                  Container(
                                    alignment: Alignment.topLeft,
                                    margin: EdgeInsets.only(top: 20, left: 30),
                                    height: 30,
                                    child: Image.asset('assets/history/transevilz.png'),
                                  ),
                                  Divider(
                                    thickness: 1.0,
                                    indent: 30,
                                    endIndent: 30,
                                  ),
                                  SizedBox(height: 3),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Tanggal',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          widget.transactionDate!,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Nama Penerima',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          widget.recipientName!,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Jenis Bank',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          widget.bank!,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Tipe Transaksi',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          widget.typeCurrency!,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'No Rekening',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          widget.recipientNorek!,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Jenis Transaksi',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          widget.typeTransaction!,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  if(widget.isExpired==false && widget.status=='In Progress')...{
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 30),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Virtual Akun',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Text(
                                                  widget.virtualAccount!,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                SizedBox(width: 5),
                                                InkWell(
                                                  onTap: () {
                                                    Clipboard.setData(ClipboardData(text: widget.virtualAccount!)).then((value) {
                                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Virtual Akun di salin')));
                                                    });
                                                  },
                                                  child: Icon(Icons.copy, size: 15, color: Colors.blue,),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  }
                                  else if(widget.isExpired==false && widget.status=='Failed')...{
                                    SizedBox(
                                      height: 12,
                                    )
                                  }
                                  else if(widget.isExpired==true && widget.status=='Failed')...{
                                      SizedBox(
                                        height: 12,
                                      )
                                    }
                                  else if(widget.isExpired==true && widget.status=='In Progress')...{
                                    SizedBox(
                                      height: 12,
                                    )
                                  }
                                  else if(widget.status=='Success')...{
                                    SizedBox(
                                      height: 12,
                                    )
                                  },
                                  SizedBox(height: 30),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Nominal',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          '${widget.nominal!} IDR',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Biaya Admin',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          '${widget.adminFee!} IDR',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Total',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        Text(
                                          '${widget.total!} IDR',
                                          style: TextStyle(
                                            fontSize: 24,
                                            color: Color(0xFFFFAD0E),
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            ReuseAppBarHistory(
              title: '',
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
