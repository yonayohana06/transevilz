import 'package:flutter/material.dart';

class ButtonApp extends StatelessWidget {
  const ButtonApp({super.key, this.title = '', this.color});

  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.blue,
              size: 28,
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
