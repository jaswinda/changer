import 'package:avsarmlm/app/utils/commons.dart';
import 'package:avsarmlm/app/utils/components/balance_tile.dart';
import 'package:avsarmlm/app/utils/components/custom_app_bar.dart';
import 'package:avsarmlm/app/utils/components/dashboard_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length + 1).toString());
    if (mounted) {
      setState(() {});
    }
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          footer: const ClassicFooter(),
          header: const MaterialClassicHeader(),
          controller: _refreshController,
          // footer: customLoader(),
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: Wrap(
            children: const [
              BalanceTile(heldBalance: '100', availableBalance: '200'),
              DashBoardButton(),
              DashBoardButton(),
              DashBoardButton(),
              DashBoardButton(),
              DashBoardButton(),
              DashBoardButton(),
            ],
            // children: [
            //   DashBoardButton(
            //       color: Colors.orange,
            //       icon: const Icon(Icons.ac_unit),
            //       text: 'text',
            //       onPressed: () {}),
            //   DashBoardButton(
            //       color: Colors.orange,
            //       icon: const Icon(Icons.ac_unit),
            //       text: 'text',
            //       onPressed: () {}),

            // ListView.builder(
            //   itemBuilder: (c, i) => Card(child: Center(child: Text(items[i]))),
            //   itemExtent: 100.0,
            //   itemCount: items.length,
            // ),

            // ],
          )),
    );
  }
}
