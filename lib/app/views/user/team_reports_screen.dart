import 'package:changer/app/utils/colors.dart';
import 'package:changer/app/utils/components/date_field.dart';
import 'package:changer/app/utils/components/date_selector.dart';
import 'package:changer/app/utils/components/record_tile.dart';
import 'package:changer/app/utils/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamReportScreen extends StatelessWidget {
  const TeamReportScreen({Key? key}) : super(key: key);

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
              excludeHeaderSemantics: true,
              title: const Text('Team Reports'),
              pinned: true,
              floating: false,
              stretch: true,
              expandedHeight: AppSizes.percentHeight(65),
              flexibleSpace: FlexibleSpaceBar(
                //hide on collapsed
                collapseMode: CollapseMode.parallax,
                stretchModes: const [
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
                background: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: AppSizes.percentHeight(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: AppSizes.percentWidth(100),
                        height: AppSizes.percentHeight(20),
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.percentWidth(5)),
                        color: Colors.white,
                        child: Wrap(children: <Widget>[
                          //search by date
                          const DateField(),
                          balanceCard(),
                          balanceCard(),
                          balanceCard(),
                          balanceCard(),
                          balanceCard(),
                          balanceCard(),
                          balanceCard(),
                          balanceCard(),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
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
                    text: 'DownLine Lvl 1',
                  ),
                  Tab(
                    text: 'DownLine Lvl 2',
                  ),
                  Tab(
                    text: 'DownLine Lvl 3',
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

  Widget balanceCard({String title = 'Title', String balance = '0.00'}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: AppSizes.percentWidth(40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blueGrey[50],
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
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                    fontSize: AppSizes.percentHeight(1.5),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: AppSizes.percentHeight(1.5)),
              Text(
                balance,
                style: TextStyle(
                    fontSize: AppSizes.percentHeight(2),
                    color: primaryColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget allRecords() {
    return SingleChildScrollView(
      child: Column(
        children: const [
          RecordTile(title: 'Deposit By User: xxx'),
          RecordTile(title: 'Withdraw By User: xxx', isWithdraw: true),
          RecordTile(title: 'Deposit By User: xxx'),
          RecordTile(title: 'Withdraw By User: xxx', isWithdraw: true),
          RecordTile(title: 'Deposit By User: xxx'),
          RecordTile(title: 'Withdraw By User: xxx', isWithdraw: true),
        ],
      ),
    );
  }

  Widget withdrawRecords() {
    return SingleChildScrollView(
      child: Column(
        children: const [
          RecordTile(title: 'Withdraw By User: xxx', isWithdraw: true),
          RecordTile(title: 'Withdraw By User: xxx', isWithdraw: true),
          RecordTile(title: 'Withdraw By User: xxx', isWithdraw: true),
        ],
      ),
    );
  }

  Widget depositRecords() {
    return SingleChildScrollView(
      child: Column(
        children: const [
          RecordTile(
            title: 'Deposit By User: xxx',
          ),
          RecordTile(
            title: 'Deposit By User: xxx',
          ),
          RecordTile(
            title: 'Deposit By User: xxx',
          ),
        ],
      ),
    );
  }
}
