import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:intl/intl.dart';
import 'package:transevilz/history/model_data/model.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({super.key});

  final List<History> tempData = [
    History(
      id: 1,
      images: 'assets/history/Ellipse.png',
      flags: 'assets/icon/flag_australia.png',
      transferType: 'IDR ke AUD',
      name: 'Aura Nugroho',
      bankType: 'BCC',
      noRek: 123412341234,
      tanggal: '21 Desember 2022',
      jumlah: 1000000,
      currency: 'IDR',
      status: 'Dalam Proses',
    ),
    History(
      id: 1,
      images: 'assets/history/Ellipse.png',
      flags: 'assets/icon/flag_australia.png',
      transferType: 'IDR ke AUD',
      name: 'Aura Nugroho',
      bankType: 'BCC',
      noRek: 123412341234,
      tanggal: '21 Desember 2022',
      jumlah: 1000000,
      currency: 'IDR',
      status: 'Gagal',
    ),
    History(
      id: 1,
      images: 'assets/history/Ellipse.png',
      flags: 'assets/icon/flag_australia.png',
      transferType: 'IDR ke AUD',
      name: 'Aura Nugroho',
      bankType: 'BCC',
      noRek: 123412341234,
      tanggal: '21 Desember 2022',
      jumlah: 1000000,
      currency: 'IDR',
      status: 'Berhasil',
    ),
    History(
      id: 1,
      images: 'assets/history/Ellipse.png',
      flags: 'assets/icon/flag_australia.png',
      transferType: 'IDR ke AUD',
      name: 'Aura Nugroho',
      bankType: 'BCC',
      noRek: 123412341234,
      tanggal: '21 Desember 2022',
      jumlah: 1000000,
      currency: 'IDR',
      status: 'Berhasil',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 25),
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
                                child: TextFormField(
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
                                child: TextFormField(
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
                    onPressed: () {},
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
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: ListView.separated(
                  itemCount: tempData.length,
                  itemBuilder: (context, snap) {
                    final dataCapture = tempData[snap];
                    final formatter = NumberFormat('#,###', 'id_ID');
                    return SizedBox(
                      height: 55,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          CircleAvatar(
                            maxRadius: double.infinity,
                            child: Image.asset(
                              dataCapture.images,
                            ),
                          ),
                          const SizedBox(width: 15,),
                          Container(
                            padding: const EdgeInsets.only(top: 7.72),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      dataCapture.flags,
                                      height: 11,
                                    ),
                                    const SizedBox(width: 9.39),
                                    Text(
                                      dataCapture.transferType,
                                      style: const TextStyle(
                                        fontSize: 8,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  dataCapture.name,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  '${dataCapture.bankType} - ${dataCapture.noRek}',
                                  style: const TextStyle(
                                      fontSize: 6
                                  ),
                                ),
                                Text(
                                  dataCapture.tanggal,
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
                              child: SizedBox()
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if(dataCapture.status=='Dalam Proses')...{
                                Container(
                                  margin: const EdgeInsets.only(right: 17, top: 7),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFFFAD0E),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                    child: Text(
                                      dataCapture.status,
                                      style: const TextStyle(
                                          fontSize: 6,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                )
                              }
                              else if(dataCapture.status=='Berhasil')...{
                                Container(
                                  margin: const EdgeInsets.only(right: 17, top: 7),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF2ACA10),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  child: Center(
                                    child: Text(
                                      dataCapture.status,
                                      style: const TextStyle(
                                          fontSize: 6,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                )
                              }
                              else if(dataCapture.status=='Gagal')...{
                                  Container(
                                    margin: const EdgeInsets.only(right: 17, top: 7),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFDC3328),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                      child: Text(
                                        dataCapture.status,
                                        style: const TextStyle(
                                            fontSize: 6,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                  )
                                },
                              Container(
                                margin: const EdgeInsets.only(
                                  bottom: 9,
                                  right: 17,
                                ),
                                child: Text(
                                  '${formatter.format(dataCapture.jumlah)} IDR',
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, snap) => const Divider(thickness: 1,),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
