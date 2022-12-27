import 'package:flutter/material.dart';

class OnBoardDesc extends StatelessWidget {
  const OnBoardDesc({
    super.key,
    required this.headline,
    required this.desc,
  });

  final String headline;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            headline,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.blue,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            desc,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF727FA3),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
