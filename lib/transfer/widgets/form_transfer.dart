import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:transevilz/login/login.dart';
import 'package:transevilz/transfer/transfer.dart';

class FormTransfer extends StatelessWidget {
  FormTransfer({super.key});

  final _controller = TextEditingController();

  final items = [
    'BCA',
    'BNI',
    'BRI',
    'CIMB Niaga',
    'Mandiri',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24.0),
      child: Form(
        key: context.read<TransferBloc>().formKey,
        onChanged: () =>
            context.read<TransferBloc>().add(EventTransferButton()),
        child: Column(
          children: [
            const TitleForm(title: 'Pilih Bank'),
            SizedBox(
              height: 46,
              child: TextFormField(
                readOnly: true,
                controller: _controller,
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
                      _controller.text = value;
                    },
                    itemBuilder: (context) {
                      return items.map<PopupMenuItem<String>>((String value) {
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
            ),
            const SizedBox(height: 20),
            const TitleForm(title: 'Nama Penerima'),
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
            )
          ],
        ),
      ),
    );
  }
}
