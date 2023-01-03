import 'package:flutter/material.dart';

class UserHistory extends StatelessWidget {
  UserHistory({super.key});

  final List<Widget> history = [
    _View(),
    _View(),
    _View(),
    _View(),
    _View(),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: ListView.builder(
            physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
            itemCount: history.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Container(
                margin: index == 0
                    ? const EdgeInsets.only(left: 25, right: 15)
                    : const EdgeInsets.only(right: 15),
                child: history[index],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 100,
      width: 180,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                "assets/icon/flag_australia.png",
                height: 15,
              ),
              const SizedBox(width: 10),
              Text(
                "IDR ke AUD",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Text(
            "BCC - 123412341234",
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "Rp 1.000.000",
            style: TextStyle(
              color: Colors.blue[800],
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
