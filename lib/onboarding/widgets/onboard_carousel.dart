import 'dart:async';

import 'package:flutter/material.dart';

class OnBoardCarousel extends StatefulWidget {
  const OnBoardCarousel({super.key});

  @override
  State<OnBoardCarousel> createState() => _OnBoardCarouselState();
}

class _OnBoardCarouselState extends State<OnBoardCarousel> {
  late int _currentPage = 0;
  late Timer _timer;
  final PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        // _currentPage = 3;
        dispose();
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 400,
      child: PageView(
        controller: _pageController,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 45),
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/onboarding/slide-1.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 45),
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/onboarding/slide-2.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 45),
            width: 200,
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/onboarding/slide-3.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
