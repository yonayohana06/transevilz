import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:transevilz/app/app.dart';
import 'package:transevilz/home/home.dart';

class UserHistory extends StatefulWidget {
  const UserHistory({super.key});

  @override
  State<UserHistory> createState() => _UserHistoryState();
}

class _UserHistoryState extends State<UserHistory> {
  List<LastTrx> _history = [];
  final _repo = ApiRepository();
  bool _loading = true;

  Future<void> _getLastTrx() async {
    _loading = true;
    await _repo.getLastTrx().then((value) {
      setState(() {
        _history = value;
      });
    });
    _loading = false;
  }

  @override
  void initState() {
    _getLastTrx();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      if (_loading) {
        return Container(
          height: 100,
          alignment: Alignment.center,
          child: const CircularProgressIndicator(
            color: Colors.white,
          ),
        );
      }
      return SizedBox(
        height: 100,
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: ListView.builder(
                physics: const ScrollPhysics(parent: BouncingScrollPhysics()),
                itemCount: _history.length.clamp(0, 5),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final items = _history[index];
                  final formatter = NumberFormat('#,###', 'id_ID');
                  return Container(
                    margin: index == 0
                        ? const EdgeInsets.only(left: 25, right: 15)
                        : const EdgeInsets.only(right: 15),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      height: 100,
                      width: 190,
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
                                "assets/icon/flag_indonesia.png",
                                height: 15,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                items.typeCurrency,
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "${items.bank} - ${items.recipientRek}",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Rp ${formatter.format(items.total)}",
                            style: TextStyle(
                              color: Colors.blue[800],
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
