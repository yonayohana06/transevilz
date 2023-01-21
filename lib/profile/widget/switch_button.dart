import 'package:flutter/material.dart';

class LanguageSwitch extends StatefulWidget {
  LanguageSwitch({
    Key? key,
    required this.nilai,
    required this.onchanged,
  }) : super(key: key);
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
    print('language: ${widget.nilai}');
    languageAnimationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: languageAnimationDuration));
    languageHorizontalMovement = Tween<double>(begin: 12.0, end: 0.0)
        .animate(languageAnimationController);
    languageAnimationController.addListener(() {
      setState(() {});
    });
    (widget.nilai == false)
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
            const Text('Bahasa'),
            GestureDetector(
              onTap: () {
                // print(widget.nilai);
                widget.nilai = !widget.nilai;
                widget.onchanged(widget.nilai);
                print(widget.nilai);
                if (widget.nilai == true) {
                  languageAnimationController.reverse();
                } else {
                  languageAnimationController.forward();
                }
              },
              child: SizedBox(
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
                            color: const Color(0xFFB8DAFF)),
                      ),
                    ),
                    Container(
                      height: languageCircleSize,
                      width: languageCircleSize,
                      margin: EdgeInsets.only(
                          left: languageHorizontalMovement.value),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.white),
                        color: const Color(0xFF3A90EF),
                        borderRadius: BorderRadius.circular(languageCircleSize),
                      ),
                      child: Center(
                        child: Text(
                          widget.nilai == false ? 'EN' : 'ID',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        const Divider(
          thickness: 1,
        )
      ],
    );
  }
}

class PermissionSwitch extends StatefulWidget {
  PermissionSwitch({Key? key, required this.nilai, required this.onchanged})
      : super(key: key);
  bool nilai;
  final Function(bool) onchanged;
  @override
  State<PermissionSwitch> createState() => _PermissionSwitchState();
}

class _PermissionSwitchState extends State<PermissionSwitch>
    with SingleTickerProviderStateMixin {
  final permissionCircleSize = 24.0;
  final permissionPlaceHolderWidth = 36.0;
  final permissionPlaceHolderHeight = 12.0;
  final permissionContainerHeight = 24.0;
  final permissionAnimationDuration = 100;
  late AnimationController permissionAnimationController;
  late Animation permissionHorizontalMovement;

  @override
  void initState() {
    super.initState();
    print('permission: ${widget.nilai}');
    permissionAnimationController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: permissionAnimationDuration));
    permissionHorizontalMovement = Tween<double>(begin: 0.0, end: 12.0)
        .animate(permissionAnimationController);
    permissionAnimationController.addListener(() {
      setState(() {});
    });
    (widget.nilai == true)
        ? permissionAnimationController.forward()
        : permissionAnimationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Izin'),
            GestureDetector(
              onTap: () {
                // print(widget.nilai);
                widget.nilai = !widget.nilai;
                widget.onchanged(widget.nilai);
                print(widget.nilai);
                if (widget.nilai == false) {
                  permissionAnimationController.reverse();
                } else {
                  permissionAnimationController.forward();
                }
              },
              child: SizedBox(
                height: permissionContainerHeight,
                width: permissionPlaceHolderWidth,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: permissionPlaceHolderHeight,
                        width: permissionPlaceHolderWidth,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: const Color(0xFFB8DAFF)),
                      ),
                    ),
                    Container(
                      height: permissionCircleSize,
                      width: permissionCircleSize,
                      margin: EdgeInsets.only(
                          left: permissionHorizontalMovement.value),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.white),
                        color: const Color(0xFFB8DAFF),
                        borderRadius:
                            BorderRadius.circular(permissionCircleSize),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        const Divider(
          thickness: 1,
        )
      ],
    );
  }
}
