import 'package:changer/app/utils/colors.dart';
import 'package:changer/app/utils/components/record_tile.dart';
import 'package:flutter/material.dart';

class RechargeRecord extends StatelessWidget {
  const RechargeRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: primaryColor,
        title: const Text('Recharge Record'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (var i = 0; i < 10; i++)
              record(
                  amount: '0.00',
                  date: 'At 2020-01-01',
                  status: 'Canceled',
                  token: 'XXXX')
          ],
        ),
      ),
    );
  }

  Widget record(
      {required String amount,
      required String date,
      required String status,
      required String token}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            ListTile(
              title: Text(token,
                  style: const TextStyle(color: primaryColor, fontSize: 20)),
              trailing: Text(amount,
                  style: const TextStyle(color: primaryColor, fontSize: 20)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Text(status.toUpperCase(),
                      style: const TextStyle(color: Colors.red)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Text(date, style: const TextStyle(color: Colors.grey)),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
