import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transevilz/profile/bloc/profile_bloc.dart';


class LanguageSwitch extends StatefulWidget {
  LanguageSwitch({Key? key, required this.nilai, required this.onchanged}) : super(key: key);
  bool nilai;
  final Function(bool) onchanged;
  @override
  State<LanguageSwitch> createState() => _LanguageSwitchState();
}

class _LanguageSwitchState extends State<LanguageSwitch>
    with SingleTickerProviderStateMixin {
  final languageCircleSize = 24.0;
  final languagePlaceHolderWidth = 36.0;
  final languagePlaceHolderHeight = 12.0;
  final languageContainerHeight = 24.0;
  final languageAnimationDuration = 100;
  late AnimationController languageAnimationController;
  late Animation languageHorizontalMovement;

  @override
  void initState() {
    super.initState();
    languageAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: languageAnimationDuration)
    );
    languageHorizontalMovement = Tween<double>(
      begin: 12.0,
      end: 0.0
    ).animate(languageAnimationController);
    languageAnimationController.addListener(() {
      setState(() {

      });
    });
    (widget.nilai==false)
        ? languageAnimationController.forward()
        : languageAnimationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Bahasa'),
            GestureDetector(
              onTap: () {
                // print(widget.nilai);
                widget.nilai = !widget.nilai;
                widget.onchanged(widget.nilai);
                print(widget.nilai);
                if(widget.nilai==true) {
                  languageAnimationController.reverse();
                } else {
                  languageAnimationController.forward();
                }
              },
              child: Container(
                height: languageContainerHeight,
                width: languagePlaceHolderWidth,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: languagePlaceHolderHeight,
                        width: languagePlaceHolderWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.blue
                        ),
                      ),
                    ),
                    Container(
                      height: languageCircleSize,
                      width: languageCircleSize,
                      margin: EdgeInsets.only(left: languageHorizontalMovement.value),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(languageCircleSize),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 14),
        Divider(thickness: 1,)
      ],
    );
  }
}
