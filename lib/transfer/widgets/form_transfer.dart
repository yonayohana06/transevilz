import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:transevilz/login/login.dart';

class FormTransfer extends StatefulWidget {
  const FormTransfer({super.key});

  @override
  State<FormTransfer> createState() => _FormTransferState();
}

class _FormTransferState extends State<FormTransfer> {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(child: Text("BCA"), value: "BCA"),
    const DropdownMenuItem(child: Text("BNI"), value: "BNI"),
    const DropdownMenuItem(child: Text("BRI"), value: "BRI"),
    const DropdownMenuItem(child: Text("CIMB Niaga"), value: "CIMB Niaga"),
    const DropdownMenuItem(child: Text("Mandiri"), value: "Mandiri"),
  ];
  final TextEditingController _controller = new TextEditingController();
  var items = [
    'BCA',
    'BNI',
    'BRI',
    'CIMB Niaga',
    'Mandiri',
  ];

  bool isClicked = false;

  clicked() {
    setState(() {
      isClicked = !isClicked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          TitleForm(title: 'Pilih Bank'),
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
                  icon: isClicked
                      ? const Icon(FeatherIcons.chevronUp)
                      : const Icon(FeatherIcons.chevronDown),
                  onSelected: (String value) {
                    isClicked = !isClicked;
                    _controller.text = value;
                  },
                  itemBuilder: (context) {
                    return items.map<PopupMenuItem<String>>((String value) {
                      return PopupMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList();
                  },
                  position: PopupMenuPosition.under,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          TitleForm(title: 'Nama Penerima'),
          SizedBox(
            height: 46,
            child: TextFormField(
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
                hintText: 'Nama Penerima',
              ),
            ),
          ),
          SizedBox(height: 20),
          TitleForm(title: 'Nomor Rekening'),
          SizedBox(
            height: 46,
            child: TextFormField(
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
                hintText: 'Nomor Rekening',
              ),
            ),
          )
        ],
      ),
    );
  }
}
