import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:transevilz/app/app.dart';
import 'package:transevilz/app/transaction/transaction.dart';
import 'package:transevilz/login/login.dart';
import 'package:transevilz/transfer/transfer.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    super.key,
    required this.total,
    required this.type,
    required this.desBank,
    required this.noRekening,
    required this.nama,
  });

  final num total;
  final String desBank;
  final String noRekening;
  final String nama;
  final TypeTransaction type;

  @override
  Widget build(BuildContext context) {
    print("ini data : $total $desBank $noRekening $nama $type");
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TransferBloc(),
        ),
        BlocProvider(
          create: (context) => TransferBloc()
            ..add(EventInitRecipient(total, desBank, noRekening, nama)),
        ),
      ],
      child: BlocListener<TransferBloc, TransferState>(
        listener: (context, state) {
          print(state);
          if (state is PaymentSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PinConfirm(
                  total: total,
                  desBank: desBank,
                  noRekening: noRekening,
                  nama: nama,
                ),
              ),
            );
          }
        },
        child: _View(type: type),
      ),
    );
  }
}

class _View extends StatelessWidget {
  final List<String> items = [
    'BCA',
    'BNI',
    'BRI',
    'CIMB Niaga',
    'Mandiri',
  ];
  final TypeTransaction type;

  _View({required this.type});

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
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      const SizedBox(height: 55),
                      Container(
                        // margin: const EdgeInsets.symmetric(horizontal: 24.0),
                        padding: const EdgeInsets.all(20),
                        height: 130,
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
                                Text(
                                  type == TypeTransaction.international
                                      ? "IDR to USD"
                                      : "IDR",
                                  style: const TextStyle(
                                    color: Color(0xFF3A3A3A),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(width: 5),
                                type == TypeTransaction.international
                                    ? Image.asset(
                                        "assets/icon/flag_usa.png",
                                        height: 16.0,
                                        fit: BoxFit.fill,
                                      )
                                    : const SizedBox(),
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
                            BlocBuilder<TransferBloc, TransferState>(
                              builder: (context, state) {
                                final total =
                                    context.read<TransferBloc>().total;
                                return Text(
                                  "$total IDR",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w700,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      const Text(
                        "Metode Pembayaran",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 30),
                      const TitleForm(title: 'Pilih Bank'),
                      Form(
                        key: context.read<TransferBloc>().formKey,
                        onChanged: () => context
                            .read<TransferBloc>()
                            .add(EventTransferButton(type)),
                        child: SizedBox(
                          height: 46,
                          child: TextFormField(
                            readOnly: true,
                            controller:
                                context.read<TransferBloc>().paymentBank,
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
                                icon: const Icon(FeatherIcons.chevronDown),
                                onSelected: (String value) {
                                  context
                                      .read<TransferBloc>()
                                      .paymentBank
                                      .text = value;
                                },
                                itemBuilder: (context) {
                                  return items.map<PopupMenuItem<String>>(
                                      (String value) {
                                    return PopupMenuItem(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList();
                                },
                                position: PopupMenuPosition.under,
                              ),
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
                  BlocBuilder<TransferBloc, TransferState>(
                    builder: (context, state) {
                      if (context.read<TransferBloc>().isEnableButton) {
                        return Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              fixedSize: const Size(0, 48),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () => context
                                .read<TransferBloc>()
                                .add(SubmitPaymentMethod()),
                            child: const Text("Selanjutnya"),
                          ),
                        );
                      }
                      return Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            fixedSize: const Size(0, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: null,
                          child: const Text("Selanjutnya"),
                        ),
                      );
                    },
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
