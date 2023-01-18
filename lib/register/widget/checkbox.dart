import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  CheckBoxWidget({Key? key, required this.value, this.onpress}) : super(key: key);
  bool value = false;
  VoidCallback? onpress;
  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onpress,
      child: Container(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            widget.value
                ? Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  width: 0.5,
                ),
              ),
              child: const Center(
                child: Icon(Icons.check, size: 13, color: Colors.white,),
              ),
            )
                : Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  width: 0.5,
                ),
              ),
            ),
            const SizedBox(width: 5),
            const Expanded(
              child: Text(
                'Saya setuju dengan Syarat & Ketentuan yang berlaku',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'DM Sans',
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
