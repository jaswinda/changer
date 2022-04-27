import 'package:flutter/material.dart';

class RecordTile extends StatelessWidget {
  final String title;
  final String amount;
  final String date;
  final bool isWithdraw;
  final bool showIcon;
  const RecordTile(
      {Key? key,
      this.title = 'Title',
      this.amount = '100',
      this.date = '2020-01-01',
      this.isWithdraw = false,
      this.showIcon = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.all(10),
        child: ListTile(
          leading: showIcon
              ? CircleAvatar(
                  backgroundColor: !isWithdraw ? Colors.green : Colors.red,
                  child: !isWithdraw
                      ? const Icon(Icons.arrow_downward, color: Colors.white)
                      : const Icon(Icons.arrow_upward, color: Colors.white),
                )
              : null,
          title: Text(title),
          subtitle: Text(date),
          trailing: Text(amount.toString()),
        ),
      ),
    );
  }
}
