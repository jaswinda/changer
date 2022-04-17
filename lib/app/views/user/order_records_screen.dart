import 'package:avsarmlm/app/utils/colors.dart';
import 'package:avsarmlm/app/utils/sizes.dart';
import 'package:flutter/material.dart';

class OrderRecordsScreen extends StatelessWidget {
  const OrderRecordsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          //preferedsize appbar
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(AppSizes.percentHeight(8)),
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              bottom: TabBar(
                indicatorColor: primaryColor,
                labelColor: lightColor,
                unselectedLabelColor: primaryColor,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50), // Creates border
                    color: primaryColor), //Change background color from here
                tabs: const [
                  Tab(
                    text: 'All',
                  ),
                  Tab(
                    text: 'Pending',
                  ),
                  Tab(
                    text: 'Completed',
                  ),
                ],
              ),
            ),
          ),

          body: const TabBarView(
            children: [
              Icon(Icons.flight, size: 350),
              Icon(Icons.directions_transit, size: 350),
              Icon(Icons.directions_car, size: 350),
            ],
          ),
        ));
  }
}
