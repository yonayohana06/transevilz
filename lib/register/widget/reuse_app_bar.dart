import 'package:flutter/material.dart';

class ReuseAppBar extends StatelessWidget {
  const ReuseAppBar({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 54,
      color: Colors.white,
      child: Stack(
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: InkWell(
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                      height: 30,
                      width: 30,
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_rounded,
                          color: Color(0xFF2075F3),
                        ),
                      )
                  )
              )
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 16.5),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'DM Sans'
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
