import 'package:flutter/material.dart';

class ReuseAppBar extends StatelessWidget {
  ReuseAppBar({Key? key, required this.title, this.onpress}) : super(key: key);
  final String title;
  VoidCallback? onpress;
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
                onTap: onpress,
                child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    height: 30,
                    width: 30,
                    child: const Center(
                      child: Icon(
                        Icons.arrow_back_rounded,
                        color: Color(0xFF2075F3),
                      ),
                    )
                ),
              )
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 16.5),
                child: Text(
                  title,
                  style: const TextStyle(
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
