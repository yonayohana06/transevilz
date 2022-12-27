import 'package:flutter/material.dart';

class OnBoardIndicator extends StatelessWidget {
  const OnBoardIndicator({super.key, required this.currentPage});

  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _View(color: currentPage == 0 ? Colors.blue : Colors.grey),
        _View(color: currentPage == 1 ? Colors.blue : Colors.grey),
        _View(color: currentPage == 2 ? Colors.blue : Colors.grey)
      ],
    );
  }
}

class _View extends StatelessWidget {
  const _View({required this.color});
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
