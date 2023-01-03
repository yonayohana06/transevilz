import 'package:flutter/material.dart';

class CurrencyExchange extends StatelessWidget {
  CurrencyExchange({super.key});

  final List<Widget> listExchange = [
    const _View(
      flag: 'flag_jepang',
      exchange: 'JPY ke IDR',
      amount: '1,00064',
      percent: '+0,20 %',
    ),
    const _View(
      flag: 'flag_usa',
      exchange: 'USD ke IDR',
      amount: '1,00164',
      percent: '+0,25 %',
    ),
    const _View(
      flag: 'flag_australia',
      exchange: 'JPY ke IDR',
      amount: '1,00014',
      percent: '+0,10 %',
    ),
    const _View(
      flag: 'flag_singapore',
      exchange: 'SGD ke IDR',
      amount: '1,00034',
      percent: '+0,15 %',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
        physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
        itemCount: listExchange.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: index == 0
                ? const EdgeInsets.only(left: 25, right: 15)
                : const EdgeInsets.only(right: 15),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: listExchange[index],
            ),
          );
        },
      ),
    );
  }
}

class _View extends StatelessWidget {
  const _View({
    required this.flag,
    required this.exchange,
    required this.amount,
    required this.percent,
  });

  final String flag;
  final String exchange;
  final String amount;
  final String percent;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 60,
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            blurStyle: BlurStyle.normal,
            color: Colors.grey.withOpacity(0.2),
            offset: const Offset(0, 1),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.0,
                color: Colors.grey[300]!,
              ),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  'assets/icon/$flag.png',
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  exchange,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  amount,
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                percent,
                style: TextStyle(
                  color: Colors.green[800],
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
