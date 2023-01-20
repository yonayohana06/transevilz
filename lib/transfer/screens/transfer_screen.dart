import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transevilz/app/app.dart';
import 'package:transevilz/transfer/transfer.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({super.key, required this.type});

  final TypeTransaction type;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransferBloc(),
      child: BlocListener<TransferBloc, TransferState>(
        listener: (context, state) {
          if (state is TransferSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => RecipientScreen(
                  type: TypeTransaction.local,
                  total: context.read<TransferBloc>().total,
                ),
              ),
            );
          }
        },
        child: _View(
          type: type,
        ),
      ),
    );
  }
}

class _View extends StatelessWidget {
  final TypeTransaction type;

  const _View({required this.type});
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<TransferBloc>().formKey,
      onChanged: () => context.read<TransferBloc>().add(
            EventTransferButton(type),
          ),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const ButtonApp(
                title: 'Masukkan Nominal',
                color: Colors.blue,
              ),
              const SizedBox(height: 55),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: context.read<TransferBloc>().amount,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    fillColor: const Color(0xFFE5F2FF),
                    filled: true,
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    hintText: 'IDR',
                    prefixIcon: Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.only(left: 10),
                      width: 55,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        color: Color(0xFFD8F0FF),
                      ),
                      child: Image.asset(
                        "assets/icon/flag_indonesia.png",
                        scale: 4,
                      ),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  validator: context.read<TransferBloc>().validateNominal,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Biaya Admin",
                      style: TextStyle(
                        color: Color(0xFF98A5D3),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      "${context.read<TransferBloc>().feeAdmin} IDR",
                      style: const TextStyle(
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
        bottomNavigationBar: BottomAppBar(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            height: 200,
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
                BlocBuilder<TransferBloc, TransferState>(
                  builder: (context, state) {
                    final total = context.read<TransferBloc>().total;
                    if (state is StateTotal) {
                      return Text(
                        "$total IDR",
                        style: const TextStyle(
                          color: Colors.green,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      );
                    }
                    return const Text(
                      "IDR",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 10),
                BlocBuilder<TransferBloc, TransferState>(
                  builder: (context, state) {
                    if (context.read<TransferBloc>().isEnableButton) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {
                          context.read<TransferBloc>().add(SubmitTransfer());
                        },
                        child: const Text("Selanjutnya"),
                      );
                    }
                    return ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        fixedSize: Size(MediaQuery.of(context).size.width, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: null,
                      child: const Text("Selanjutnya"),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
