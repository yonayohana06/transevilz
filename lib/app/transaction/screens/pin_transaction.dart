import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transevilz/app/app.dart';
import 'package:transevilz/app/transaction/transaction.dart';
import 'package:transevilz/forgot/forgot.dart';
import 'package:transevilz/transfer/transfer.dart';

class PinConfirm extends StatelessWidget {
  const PinConfirm({
    super.key,
    required this.total,
    required this.desBank,
    required this.noRekening,
    required this.nama,
  });

  final num total;
  final String desBank;
  final String noRekening;
  final String nama;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TransferBloc(),
      child: BlocListener<TransferBloc, TransferState>(
        listener: (context, state) {
          if (state is TransferSuccess) {
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                Future.delayed(
                  const Duration(seconds: 1),
                  () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => InvoiceScreen(
                          total: total,
                          desBank: desBank,
                          noRekening: noRekening,
                          nama: nama,
                        ),
                      ),
                      (route) => false,
                    );
                  },
                );
                return Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 20,
                  child: const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.green,
                    ),
                  ),
                );
              },
            );
          }
          if (state is TransferFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.msg),
                backgroundColor: Colors.red,
                duration: const Duration(seconds: 1),
              ),
            );
          }
        },
        child: PinTransaction(
          desBank: desBank,
          nama: nama,
          noRekening: noRekening,
          total: total,
        ),
      ),
    );
  }
}

class PinTransaction extends StatefulWidget {
  const PinTransaction({
    super.key,
    required this.total,
    required this.desBank,
    required this.noRekening,
    required this.nama,
  });
  final num total;
  final String desBank;
  final String noRekening;
  final String nama;

  @override
  State<PinTransaction> createState() => _PinTransactionState();
}

class _PinTransactionState extends State<PinTransaction> {
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
                    controller: context.read<TransferBloc>().pin,
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
                          builder: (context) => const ForgotPinScreen(),
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
            BlocBuilder<TransferBloc, TransferState>(
              builder: (context, state) {
                return PinNumpad(
                  onChanged: (String value) {
                    final pin = context.read<TransferBloc>().pin;
                    final pinLength = context.read<TransferBloc>().pinLength;
                    if (value == 'hapus') {
                      _deleteLastChar();
                    }
                    if (pin.text.length < pinLength) {
                      if (value != 'hapus') {
                        setState(() {
                          pin.text += value;
                        });
                      }
                      context.read<TransferBloc>().recipientRek =
                          widget.noRekening;
                      context.read<TransferBloc>().total = widget.total;
                      if (pin.text.length == pinLength) {
                        print(pin.text);
                        context.read<TransferBloc>().add(SubmitAllDataTrx());
                      }
                      // if (pin.text == pinDummy) {
                      //   Navigator.pushAndRemoveUntil(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (_) => InvoiceScreen(
                      //         total: widget.total,
                      //         desBank: widget.desBank,
                      //         noRekening: widget.noRekening,
                      //         nama: widget.nama,
                      //       ),
                      //     ),
                      //     (route) => false,
                      //   );
                      // }
                      // if (pin.text.length == pinLength && pin.text != pinDummy) {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     const SnackBar(
                      //       content: Text('Pin Salah'),
                      //       backgroundColor: Colors.red,
                      //       duration: Duration(seconds: 2),
                      //     ),
                      //   );
                      // }
                    }
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void _deleteLastChar() {
    final pin = context.read<TransferBloc>().pin;
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
