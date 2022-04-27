import 'package:changer/app/utils/colors.dart';
import 'package:changer/app/utils/sizes.dart';
import 'package:flutter/material.dart';

class AccountingDetailsScreen extends StatelessWidget {
  const AccountingDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              foregroundColor: primaryColor,
              backgroundColor: Colors.white,
              title: const Text('Accounting Details'),
              pinned: true,
              floating: true,
              bottom: TabBar(
                labelStyle: TextStyle(
                  fontSize: AppSizes.percentHeight(1.5),
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
                indicatorColor: primaryColor,
                //tab bar padding
                padding: EdgeInsets.only(
                    left: AppSizes.percentWidth(2),
                    right: AppSizes.percentWidth(2)),

                labelColor: lightColor,
                unselectedLabelColor: primaryColor,
                physics: const BouncingScrollPhysics(),
                //iphone like tab bar
                indicator: BoxDecoration(
                  //shadow
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10.0,
                      spreadRadius: 5.0,
                      offset: Offset(
                        10.0,
                        10.0,
                      ),
                    )
                  ],

                  borderRadius: BorderRadius.circular(10), // Creates border
                  color: primaryColor, //Change background color from here
                ),
                tabs: const [
                  Tab(
                    text: 'All',
                  ),
                  Tab(
                    text: 'Withdraw',
                  ),
                  Tab(
                    text: 'Deposit',
                  ),
                ],
              ),
            ),
          ];
        },
        body: TabBarView(
          children: [allRecords(), withdrawRecords(), depositRecords()],
        ),
      )),
    );
  }

  Widget allRecords() {
    return SingleChildScrollView(
      child: Column(
        children: [
          recordTile(),
          recordTile(isWithdraw: true),
          recordTile(),
          recordTile(isWithdraw: true),
          recordTile(),
          recordTile(isWithdraw: true),
        ],
      ),
    );
  }

  Widget withdrawRecords() {
    return Column(
      children: [
        // recordTile(),
        recordTile(isWithdraw: true),
        // recordTile(),
        recordTile(isWithdraw: true),
        // recordTile(),
        recordTile(isWithdraw: true),
      ],
    );
  }

  Widget depositRecords() {
    return Column(
      children: [
        recordTile(),
        // recordTile(isWithdraw: true),
        recordTile(),
        // recordTile(isWithdraw: true),
        recordTile(),
      ],
    );
  }

  Widget recordTile(
      {String? title, String? amount, String? date, isWithdraw = false}) {
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
          leading: CircleAvatar(
            backgroundColor: !isWithdraw ? Colors.green : Colors.red,
            child: const Icon(Icons.attach_money, color: Colors.white),
          ),
          title: const Text('Event Bonus'),
          subtitle: const Text('AT: 12/12/2019 - 12:00'),
          trailing: const Text('\$100'),
        ),
      ),
    );
  }
}
