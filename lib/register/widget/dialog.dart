import 'package:flutter/material.dart';


class DialogWidget extends StatelessWidget {
  DialogWidget({
    Key? key,
    required this.image,
    required this.status,
    required this.buttonlabel,
    this.onpress
  }) : super(key: key);
  final Text status;
  final Widget image;
  final String buttonlabel;
  VoidCallback? onpress;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      ),
      child: Container(
        height: 332,
        width: 342,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 54),
                  height: 100,
                  width: 87,
                  child: image,
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 21),
                  child: status,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 41, left: 24, right: 24),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2075F3),
                    fixedSize: const Size(294, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    )
                  ),
                  onPressed: onpress,
                  child: Text(
                    buttonlabel,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Poppins',
                        color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
