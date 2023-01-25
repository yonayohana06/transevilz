import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:intl/intl.dart';
import 'package:transevilz/history/screens/bukti_transfer.dart';
import 'package:transevilz/history/widget/dialog.dart';

import '../bloc/history_bloc.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocListener<HistoryBloc, HistoryState>(
          listener: (context, state) {
            if(state is InversedDate) {
              showDialog(
                context: (context),
                barrierDismissible: false,
                builder: (_) => DialogWidget(
                  image: Icon(
                    Icons.cancel_rounded,
                    color: Colors.red,
                    size: 80,
                  ),
                  status: Text(
                    'Tanggal Awal tidak boleh lebih besar dari Tanggal Akhir',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.red,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  buttonlabel: 'Oke',
                  onpress: () {
                    Navigator.pop(context);
                  },
                ),
              );
            }
          },
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16.5),
                child: Column(
                  children: [
                    const Text(
                      'Riwayat Transaksi',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.blue,
                      ),
                    ),
                    const SizedBox(height: 36.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                const Text(
                                  'Dari:',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 7, top: 5),
                                  height: 40,
                                  width: 100,
                                  child: TextField(
                                    onTap: () async {
                                      await context.read<HistoryBloc>().pickedFromData(context);
                                      if(context.read<HistoryBloc>().pickedFrom==null) {
                                        context.read<HistoryBloc>().firstRange.clear();
                                      }
                                    },
                                    controller: context.read<HistoryBloc>().firstRange,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(10),
                                      fillColor: const Color(0xFFE5F2FF),
                                      filled: true,
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'dd/mm/yyyy',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  children: const [
                                    SizedBox(width: 7),
                                    Text(
                                      'Sampai:',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 7, top: 5),
                                  height: 40,
                                  width: 100,
                                  child: TextField(
                                    onTap: () async {
                                      await context.read<HistoryBloc>().pickedTillData(context);
                                      if(context.read<HistoryBloc>().pickedTill==null) {
                                        context.read<HistoryBloc>().lastRange.clear();
                                      }
                                    },
                                    controller: context.read<HistoryBloc>().lastRange,
                                    decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.all(10),
                                      fillColor: const Color(0xFFE5F2FF),
                                      filled: true,
                                      hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      hintText: 'dd/mm/yyyy',
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                    const SizedBox(height: 46),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(
                          MediaQuery.of(context).size.width,
                          39,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        context.read<HistoryBloc>().add(SampaiEvent());
                        context.read<HistoryBloc>().add(DariEvent());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Cari'),
                          SizedBox(width: 20),
                          Icon(
                            FeatherIcons.search,
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(height: 19),
              BlocBuilder<HistoryBloc, HistoryState>(
                builder: (context, state) {
                  print(state);
                  if(state is HistoryInitial) {
                    return Center(
                      child: Text('Silahkan Masukan tanggal berurutan'),
                    );
                  }
                  if(state is InversedDate) {
                    return Center(
                      child: Text('Tanggal yang anda masukan tidak berurutan'),
                    );
                  }
                  if(state is HistoryLoaded) {
                    return Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 24),
                        child: FutureBuilder(
                          future: context.read<HistoryBloc>().fetchDataUser(),
                          builder: (context, snap) {
                            if(snap.connectionState==ConnectionState.done) {
                              if(snap.hasData) {
                                return ListView.builder(
                                  itemCount: snap.data!.length,
                                  itemBuilder: (context, historyData) {
                                    final sorter = snap.data!;
                                    final formatter = NumberFormat('#,###', 'id_ID');
                                    sorter.sort((a, b) {
                                      final parseToDateA = DateFormat('yyyy-MM-ddTHH:mm:ss').parse(a.transaction_date!);
                                      final parseToDateB = DateFormat('yyyy-MM-ddTHH:mm:ss').parse(b.transaction_date!);
                                      return parseToDateA.compareTo(parseToDateB);
                                    });
                                    final formatBacktoDate = DateFormat('yyyy-MM-dd').parse(sorter[historyData].transaction_date!);
                                    final formatDateNow = DateTime(formatBacktoDate.year, formatBacktoDate.month, formatBacktoDate.day);
                                    final sameFrom = formatDateNow.isAtSameMomentAs(context.read<HistoryBloc>().pickedFrom!);
                                    final sameTill = formatDateNow.isAtSameMomentAs(context.read<HistoryBloc>().pickedTill!);
                                    final itsFrom = formatDateNow.isAfter(context.read<HistoryBloc>().pickedFrom!);
                                    final itsTill = formatDateNow.isBefore(context.read<HistoryBloc>().pickedTill!);
                                    final formatToShow = DateFormat('dd MMMM yyyy').format(formatDateNow);
                                    final dateParse = DateFormat('yyyy-MM-ddTHH:mm:ss').parse(sorter[historyData].transaction_date!);
                                    final toDateTime = DateTime(dateParse.year, dateParse.month, dateParse.day, dateParse.hour + 7, dateParse.minute, dateParse.second);
                                    final backToString = DateFormat('dd MMMM yyyy HH:mm:ss').format(toDateTime);
                                    final totalFormat = formatter.format(sorter[historyData].total);
                                    final nominalFormat = formatter.format(sorter[historyData].nominal);
                                    final adminFeeFormat = formatter.format(sorter[historyData].admin_fee);
                                    final now = DateTime.now();
                                    final expiredFromDatabase = sorter[historyData].expired_at!;
                                    final expireExpiredParse = DateFormat('yyyy-MM-ddTHH:mm:ss').parse(expiredFromDatabase);
                                    final expiredLocalTime = DateTime(expireExpiredParse.year, expireExpiredParse.month, expireExpiredParse.day, expireExpiredParse.hour + 7, expireExpiredParse.minute, expireExpiredParse.second);
                                    final expiredLocalToString = DateFormat('yyyy-MM-ddTHH:mm:ss').format(expiredLocalTime);
                                    final expireAtDateParse = DateFormat('yyyy-MM-ddTHH:mm:ss').parse(expiredLocalToString).difference(now);
                                    final secondsCount = expireAtDateParse.inSeconds;
                                    print(formatToShow);
                                    if(sameFrom | itsFrom && sameTill | itsTill) {
                                      return Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (_) {
                                                    return BuktiTransfer(
                                                      recipientName: sorter[historyData].recipient_name!,
                                                      senderName: sorter[historyData].sender_name!,
                                                      bank: sorter[historyData].bank!,
                                                      typeCurrency: sorter[historyData].type_currency!,
                                                      typeTransaction: sorter[historyData].type_transaction!,
                                                      recipientNorek: sorter[historyData].recipient_norek!,
                                                      virtualAccount: sorter[historyData].virtual_account!,
                                                      total: totalFormat,
                                                      nominal: nominalFormat,
                                                      status: sorter[historyData].status!,
                                                      adminFee: adminFeeFormat,
                                                      swiftNumber: sorter[historyData].swift_number!,
                                                      transactionDate: backToString,
                                                      expiredAt: sorter[historyData].expired_at!,
                                                      isExpired: sorter[historyData].isExpired!,
                                                      timeLeft: secondsCount,
                                                    );
                                                  },
                                                ),
                                              );
                                            },
                                            child: Container(
                                              color: Colors.transparent,
                                              width: MediaQuery.of(context).size.width,
                                              height: 55,
                                              child: Row(
                                                children: [
                                                  CircleAvatar(
                                                    maxRadius: double.infinity,
                                                    child: Image.asset(
                                                      'assets/history/Ellipse.png',
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.only(top: 7.72),
                                                    child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Row(
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Image.asset(
                                                              sorter[historyData].type_transaction=='Lokal'
                                                                  ? 'assets/icon/flag_indonesia.png'
                                                                  : 'assets/icon/flag_australia.png',
                                                              height: 11,
                                                            ),
                                                            const SizedBox(width: 9.39),
                                                            Text(
                                                              sorter[historyData].type_currency!,
                                                              style: const TextStyle(
                                                                fontSize: 8,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Text(
                                                          '${sorter[historyData].recipient_name}',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w700,
                                                          ),
                                                        ),
                                                        Text(
                                                          '${sorter[historyData].bank} - ${sorter[historyData].recipient_norek}',
                                                          style: const TextStyle(
                                                              fontSize: 6
                                                          ),
                                                        ),
                                                        Text(
                                                          formatToShow,
                                                          style: const TextStyle(
                                                              fontSize: 6,
                                                              fontWeight: FontWeight.w400,
                                                              color: Color(0xFF98A5D3)
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const Expanded(
                                                    child: SizedBox(),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      if(sorter[historyData].isExpired==false && sorter[historyData].status=='In Progress')...{
                                                        Container(
                                                          margin: const EdgeInsets.only(right: 17),
                                                          padding: const EdgeInsets.symmetric(
                                                            horizontal: 8,
                                                            vertical: 3.5,
                                                          ),
                                                          decoration: BoxDecoration(
                                                            color: const Color(0xFFFFAD0E),
                                                            borderRadius: BorderRadius.circular(30),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              'Dalam Proses',
                                                              style: const TextStyle(
                                                                  fontSize: 6,
                                                                  fontWeight: FontWeight.w700,
                                                                  color: Colors.white
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      }
                                                      else if(sorter[historyData].isExpired==false && sorter[historyData].status=='Failed')...{
                                                        Container(
                                                          margin: const EdgeInsets.only(right: 17),
                                                          padding: const EdgeInsets.symmetric(
                                                            horizontal: 18,
                                                            vertical: 3.5,
                                                          ),
                                                          decoration: BoxDecoration(
                                                            color: const Color(0xFFDC3328),
                                                            borderRadius: BorderRadius.circular(30),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              'Gagal',
                                                              style: const TextStyle(
                                                                  fontSize: 6,
                                                                  fontWeight: FontWeight.w700,
                                                                  color: Colors.white
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      }
                                                      else if(sorter[historyData].isExpired==true && sorter[historyData].status=='Failed')...{
                                                        Container(
                                                          margin: const EdgeInsets.only(right: 17),
                                                          padding: const EdgeInsets.symmetric(
                                                            horizontal: 18,
                                                            vertical: 3.5,
                                                          ),
                                                          decoration: BoxDecoration(
                                                            color: const Color(0xFFDC3328),
                                                            borderRadius: BorderRadius.circular(30),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              'Gagal',
                                                              style: const TextStyle(
                                                                  fontSize: 6,
                                                                  fontWeight: FontWeight.w700,
                                                                  color: Colors.white
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      }
                                                      else if(sorter[historyData].isExpired==true && sorter[historyData].status=='In Progress')...{
                                                        Container(
                                                          margin: const EdgeInsets.only(right: 17),
                                                          padding: const EdgeInsets.symmetric(
                                                            horizontal: 18,
                                                            vertical: 3.5,
                                                          ),
                                                          decoration: BoxDecoration(
                                                            color: const Color(0xFFDC3328),
                                                            borderRadius: BorderRadius.circular(30),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              'Gagal',
                                                              style: const TextStyle(
                                                                  fontSize: 6,
                                                                  fontWeight: FontWeight.w700,
                                                                  color: Colors.white
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      }
                                                      else if(sorter[historyData].status=='Success')...{
                                                        Container(
                                                          margin: const EdgeInsets.only(right: 17),
                                                          padding: const EdgeInsets.symmetric(
                                                            horizontal: 18,
                                                            vertical: 3.5,
                                                          ),
                                                          decoration: BoxDecoration(
                                                            color: const Color(0xFF2ACA10),
                                                            borderRadius: BorderRadius.circular(30),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              'Berhasil',
                                                              style: const TextStyle(
                                                                  fontSize: 6,
                                                                  fontWeight: FontWeight.w700,
                                                                  color: Colors.white
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      },
                                                      Container(
                                                        margin: const EdgeInsets.only(
                                                          right: 17,
                                                        ),
                                                        child: Text(
                                                          '${formatter.format(sorter[historyData].total)} IDR',
                                                          style: const TextStyle(
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.w700,
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Icon(Icons.arrow_forward_ios_rounded, color: Colors.blue,)
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 12),
                                          Divider(thickness: 1,)
                                        ],
                                      );
                                    } return Container();
                                  },
                                );
                              }
                            } return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                      )
                    );
                    // return Expanded(
                    //   child: Container(
                    //     padding: const EdgeInsets.symmetric(horizontal: 24),
                    //     child: ListView.builder(
                    //       itemCount: context.read<HistoryBloc>().tempData.length,
                    //       itemBuilder: (context, snap) {
                    //         final dataCapture = context.read<HistoryBloc>().tempData[snap];
                    //         final formatter = NumberFormat('#,###', 'id_ID');
                    //         final dateTimeString = context.read<HistoryBloc>().tempData;
                    //         dateTimeString.sort((a, b) => a.tanggal.compareTo(b.tanggal));
                    //         final sameFrom = context.read<HistoryBloc>().tempData[snap].tanggal.isAtSameMomentAs(context.read<HistoryBloc>().pickedFrom!);
                    //         final sameTill = context.read<HistoryBloc>().tempData[snap].tanggal.isAtSameMomentAs(context.read<HistoryBloc>().pickedTill!);
                    //         final itsFrom = context.read<HistoryBloc>().tempData[snap].tanggal.isAfter(context.read<HistoryBloc>().pickedFrom!);
                    //         final itsTill = context.read<HistoryBloc>().tempData[snap].tanggal.isBefore(context.read<HistoryBloc>().pickedTill!);
                    //         final formatTanggalShowed = DateFormat('dd MMMM yyyy').format(context.read<HistoryBloc>().tempData[snap].tanggal);
                    //         if(sameFrom | itsFrom && sameTill | itsTill)
                    //         {
                    //           return Column(
                    //             children: [
                    //               SizedBox(
                    //                 height: 55,
                    //                 width: MediaQuery.of(context).size.width,
                    //                 child: Row(
                    //                   children: [
                    //                     CircleAvatar(
                    //                       maxRadius: double.infinity,
                    //                       child: Image.asset(
                    //                         dataCapture.images,
                    //                       ),
                    //                     ),
                    //                     const SizedBox(width: 15,),
                    //                     Container(
                    //                       padding: const EdgeInsets.only(top: 7.72),
                    //                       child: Column(
                    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                         crossAxisAlignment: CrossAxisAlignment.start,
                    //                         children: [
                    //                           Row(
                    //                             crossAxisAlignment: CrossAxisAlignment.center,
                    //                             children: [
                    //                               Image.asset(
                    //                                 dataCapture.flags,
                    //                                 height: 11,
                    //                               ),
                    //                               const SizedBox(width: 9.39),
                    //                               Text(
                    //                                 dataCapture.transferType,
                    //                                 style: const TextStyle(
                    //                                   fontSize: 8,
                    //                                 ),
                    //                               ),
                    //                             ],
                    //                           ),
                    //                           Text(
                    //                             dataCapture.name,
                    //                             style: const TextStyle(
                    //                               fontSize: 12,
                    //                               fontWeight: FontWeight.w700,
                    //                             ),
                    //                           ),
                    //                           Text(
                    //                             '${dataCapture.bankType} - ${dataCapture.noRek}',
                    //                             style: const TextStyle(
                    //                                 fontSize: 6
                    //                             ),
                    //                           ),
                    //                           Text(
                    //                             formatTanggalShowed,
                    //                             style: const TextStyle(
                    //                                 fontSize: 6,
                    //                                 fontWeight: FontWeight.w400,
                    //                                 color: Color(0xFF98A5D3)
                    //                             ),
                    //                           ),
                    //                         ],
                    //                       ),
                    //                     ),
                    //                     const Expanded(
                    //                         child: SizedBox()
                    //                     ),
                    //                     Column(
                    //                       crossAxisAlignment: CrossAxisAlignment.end,
                    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //                       children: [
                    //                         if(dataCapture.status=='Dalam Proses')...{
                    //                           Container(
                    //                             margin: const EdgeInsets.only(right: 17),
                    //                             padding: const EdgeInsets.symmetric(
                    //                               horizontal: 8,
                    //                               vertical: 2,
                    //                             ),
                    //                             decoration: BoxDecoration(
                    //                               color: const Color(0xFFFFAD0E),
                    //                               borderRadius: BorderRadius.circular(30),
                    //                             ),
                    //                             child: Center(
                    //                               child: Text(
                    //                                 dataCapture.status,
                    //                                 style: const TextStyle(
                    //                                     fontSize: 6,
                    //                                     fontWeight: FontWeight.w700,
                    //                                     color: Colors.white
                    //                                 ),
                    //                               ),
                    //                             ),
                    //                           )
                    //                         }
                    //                         else if(dataCapture.status=='Berhasil')...{
                    //                           Container(
                    //                             margin: const EdgeInsets.only(right: 17),
                    //                             padding: const EdgeInsets.symmetric(
                    //                               horizontal: 8,
                    //                               vertical: 2,
                    //                             ),
                    //                             decoration: BoxDecoration(
                    //                               color: const Color(0xFF2ACA10),
                    //                               borderRadius: BorderRadius.circular(30),
                    //                             ),
                    //                             child: Center(
                    //                               child: Text(
                    //                                 dataCapture.status,
                    //                                 style: const TextStyle(
                    //                                     fontSize: 6,
                    //                                     fontWeight: FontWeight.w700,
                    //                                     color: Colors.white
                    //                                 ),
                    //                               ),
                    //                             ),
                    //                           )
                    //                         }
                    //                         else if(dataCapture.status=='Gagal')...{
                    //                             Container(
                    //                               margin: const EdgeInsets.only(right: 17),
                    //                               padding: const EdgeInsets.symmetric(
                    //                                 horizontal: 10,
                    //                                 vertical: 2,
                    //                               ),
                    //                               decoration: BoxDecoration(
                    //                                 color: const Color(0xFFDC3328),
                    //                                 borderRadius: BorderRadius.circular(30),
                    //                               ),
                    //                               child: Center(
                    //                                 child: Text(
                    //                                   dataCapture.status,
                    //                                   style: const TextStyle(
                    //                                       fontSize: 6,
                    //                                       fontWeight: FontWeight.w700,
                    //                                       color: Colors.white
                    //                                   ),
                    //                                 ),
                    //                               ),
                    //                             )
                    //                           },
                    //                         Container(
                    //                           margin: const EdgeInsets.only(
                    //                             right: 17,
                    //                           ),
                    //                           child: Text(
                    //                             '${formatter.format(dataCapture.jumlah)} IDR',
                    //                             style: const TextStyle(
                    //                               fontSize: 14,
                    //                               fontWeight: FontWeight.w700,
                    //                             ),
                    //                           ),
                    //                         )
                    //                       ],
                    //                     ),
                    //                     GestureDetector(
                    //                       onTap: () {
                    //                         Navigator.push(
                    //                           context,
                    //                           MaterialPageRoute(
                    //                             builder: (context) {
                    //                               return BuktiTransfer();
                    //                             },
                    //                           ),
                    //                         );
                    //                       },
                    //                       child: Icon(Icons.arrow_forward_ios_rounded, color: Colors.blue,),
                    //                     )
                    //                   ],
                    //                 ),
                    //               ),
                    //               const SizedBox(height: 12),
                    //               Divider(thickness: 1),
                    //               const SizedBox(height: 5)
                    //             ],
                    //           );
                    //         }
                    //         return Container();
                    //       },
                    //     ),
                    //   ),
                    // );
                  }
                  return Center(
                    child: Text('Anda belum memasukan tanggal'),
                  );
                },
              )
            ],
          ),
        )
      ),
    );
  }
}
