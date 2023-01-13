import 'package:flutter/material.dart';

class PinNumpad extends StatelessWidget {
  const PinNumpad({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.count(
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 3,
        childAspectRatio: 1.9,
        mainAxisSpacing: 15,
        crossAxisSpacing: 10,
        shrinkWrap: true,
        children: [
          NumberPadItem(
            text: '1',
            onPress: () {
              onChanged('1');
            },
          ),
          NumberPadItem(
            text: '2',
            onPress: () {
              onChanged('2');
            },
          ),
          NumberPadItem(
            text: '3',
            onPress: () {
              onChanged('3');
            },
          ),
          NumberPadItem(
            text: '4',
            onPress: () {
              onChanged('4');
            },
          ),
          NumberPadItem(
            text: '5',
            onPress: () {
              onChanged('5');
            },
          ),
          NumberPadItem(
            text: '6',
            onPress: () {
              onChanged('6');
            },
          ),
          NumberPadItem(
            text: '7',
            onPress: () {
              onChanged('7');
            },
          ),
          NumberPadItem(
            text: '8',
            onPress: () {
              onChanged('8');
            },
          ),
          NumberPadItem(
            text: '9',
            onPress: () {
              onChanged('9');
            },
          ),
          const NumberPadItem(text: ''),
          NumberPadItem(
            text: '0',
            onPress: () {
              onChanged('0');
            },
          ),
          NumberPadItem(
            text: '12',
            icon: const Icon(
              Icons.backspace_outlined,
              color: Color(0xFF2F82FF),
            ),
            onPress: () {
              onChanged('hapus');
            },
          ),
        ],
      ),
    );
  }
}

class NumberPadItem extends StatelessWidget {
  const NumberPadItem({
    super.key,
    required this.text,
    this.icon,
    this.onPress,
  });

  final String text;
  final Icon? icon;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    if (text == '') {
      return Container(
        height: 60,
        width: 60,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        alignment: Alignment.center,
      );
    }
    return Container(
      height: 60,
      width: 60,
      decoration: const BoxDecoration(
        color: Color(0xFFE5F2FF),
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: MaterialButton(
        minWidth: 50,
        height: 60,
        onPressed: onPress,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
        child: Builder(
          builder: (context) {
            if (icon != null) {
              return icon!;
            }
            return Text(
              text,
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            );
          },
        ),
      ),
    );
  }
}
