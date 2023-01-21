import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:transevilz/app/app.dart';
import 'package:transevilz/login/login.dart';
import 'package:transevilz/transfer/transfer.dart';

class FormTransfer extends StatefulWidget {
  const FormTransfer({super.key, required this.type});

  final TypeTransaction type;

  @override
  State<FormTransfer> createState() => _FormTransferState();
}

class _FormTransferState extends State<FormTransfer> {
  final _repo = ApiRepository();
  List<Bank> _listBank = [];

  _getBank() async {
    await _repo.getBank().then((value) {
      setState(() {
        _listBank = value;
      });
    });
  }

  @override
  void initState() {
    _getBank();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<TransferBloc>().formKey,
      onChanged: () =>
          context.read<TransferBloc>().add(EventTransferButton(widget.type)),
      child: Container(
        margin: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const TitleForm(title: 'Pilih Bank'),
            SizedBox(
              height: 46,
              child: TextFormField(
                readOnly: true,
                controller: context.read<TransferBloc>().destinationBank,
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
                  suffixIcon: PopupMenuButton(
                    icon: const Icon(FeatherIcons.chevronDown),
                    onSelected: (value) {
                      context.read<TransferBloc>().destinationBank.text = value;
                    },
                    itemBuilder: (context) {
                      return _listBank.map<PopupMenuItem>((e) {
                        return PopupMenuItem(
                          value: e.name,
                          child: Text(e.name),
                          onTap: () => context
                              .read<TransferBloc>()
                              .recipientBankCode = e.code,
                        );
                      }).toList();
                      // return bank
                      //     .map<PopupMenuItem>(() {
                      //   return PopupMenuItem(
                      //     value: value,
                      //     child: Text(value),
                      //   );
                      // }).toList();
                    },
                    position: PopupMenuPosition.under,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const TitleForm(title: 'Nomor Rekening'),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: context.read<TransferBloc>().noRek,
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
                hintText: 'Nomor Rekening',
              ),
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
              ],
              keyboardType: TextInputType.phone,
              validator: context.read<TransferBloc>().validateNoRek,
              onChanged: (value) {
                context.read<TransferBloc>().add(EventSearchRek(value));
              },
            ),
            const SizedBox(height: 20),
            _nameRecipient('Nama Penerima'),
            TextFormField(
              readOnly: true,
              controller: context.read<TransferBloc>().nameRecipient,
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
                hintText: 'Nama Penerima',
              ),
            ),
            const SizedBox(height: 20),
            _kodeSwift(context),
          ],
        ),
      ),
    );
  }

  Widget _nameRecipient(String title) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _kodeSwift(BuildContext context) {
    if (widget.type == TypeTransaction.international) {
      return Column(
        children: [
          const TitleForm(title: 'Kode Swift'),
          TextFormField(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: context.read<TransferBloc>().kodeSwift,
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
              hintText: 'Kode Swift',
            ),
            validator: context.read<TransferBloc>().validateNoRek,
          ),
          Container(
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(
              top: 10,
              bottom: 50,
              right: 24,
            ),
            child: GestureDetector(
              onTap: () {
                context.read<TransferBloc>().launchURL();
              },
              child: const Text(
                'Silakan cek kode swift disini',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      );
    }
    return const SizedBox();
  }
}
