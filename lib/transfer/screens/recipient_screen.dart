import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transevilz/app/app.dart';
import 'package:transevilz/transfer/transfer.dart';

class RecipientScreen extends StatelessWidget {
  const RecipientScreen({
    super.key,
    required this.total,
    required this.type,
  });

  final num total;
  final TypeTransaction type;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TransferBloc(),
        ),
        BlocProvider(
          create: (context) => TransferBloc()
            ..add(EventInit(
              total,
            )),
        ),
      ],
      child: BlocListener<TransferBloc, TransferState>(
        listener: (context, state) {
          // print(state);
          if (state is RecipientSuccess) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PaymentMethod(
                  type: type,
                  total: total,
                  desBank: context.read<TransferBloc>().recipientBank,
                  noRekening: context.read<TransferBloc>().recipientRek,
                  nama: context.read<TransferBloc>().recipientName,
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
  final TypeTransaction type;

  const _View({required this.type});
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
                    _total(context),
                    FormTransfer(type: type),
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
          height: 100,
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
                      onPressed: () {
                        context.read<TransferBloc>().clearForm();
                      },
                      child: const Text(
                        "Atur Ulang",
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
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
                            onPressed: () {
                              context
                                  .read<TransferBloc>()
                                  .add(SubmitRecipient());
                            },
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

  Widget _total(context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24.0),
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
                type == TypeTransaction.international ? "IDR to USD" : "IDR",
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
              final total = context.read<TransferBloc>().total;
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
    );
  }
}
