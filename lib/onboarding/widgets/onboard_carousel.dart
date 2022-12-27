import 'dart:async';

import 'package:flutter/material.dart';
import 'package:transevilz/onboarding/onboarding.dart';

class OnBoardCarousel extends StatefulWidget {
  final Function(int) onChanged;
  const OnBoardCarousel({super.key, required this.onChanged});

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
        _currentPage = 0;
        // dispose();
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
        onPageChanged: (currentPage) {
          widget.onChanged(currentPage);
        },
        children: [
          Column(
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
              const SizedBox(height: 40),
              const OnBoardDesc(
                headline: 'Teknologi terkini\n yang memberikan kemudahan\n'
                    'bagi Anda',
                desc: 'Lorem Ipsum is simply dummy text of the printing\n'
                    'and typesetting industry.',
              )
            ],
          ),
          Column(
            children: [
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
              const SizedBox(height: 40),
              const OnBoardDesc(
                headline: 'Anda dapat melakukan\n transfer antar Negara\n'
                    'dengan Mudah',
                desc: 'Lorem Ipsum is simply dummy text of the printing\n'
                    'and typesetting industry.',
              )
            ],
          ),
          Column(
            children: [
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
              const SizedBox(height: 40),
              const OnBoardDesc(
                headline: 'Lalu, Tunggu Apalagi,\n Gabung sekarang dengan\n'
                    'TransEvilz',
                desc: 'Lorem Ipsum is simply dummy text of the printing\n'
                    'and typesetting industry.',
              )
            ],
          ),
        ],
      ),
    );
  }
}
