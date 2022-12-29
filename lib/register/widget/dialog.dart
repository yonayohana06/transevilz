import 'package:flutter/material.dart';


class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    Key? key,
    required this.image,
    required this.status,
    required this.buttonlabel
  }) : super(key: key);
  final String status;
  final Image image;
  final String buttonlabel;
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
              children: [
                Container(
                  margin: EdgeInsets.only(top: 54),
                  height: 100,
                  width: 87,
                  child: image,
                ),
                SizedBox(height: 5),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 21),
                  child: Text(
                    status,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'DM Sans',
                      color: Color(0xFF3A3A3A)
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 41, left: 24, right: 24),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2075F3),
                    fixedSize: Size(294, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    )
                  ),
                  onPressed: () {},
                  child: Text(
                    buttonlabel,
                    style: TextStyle(
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
