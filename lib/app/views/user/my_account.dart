import 'package:changer/app/utils/components/balance_tile.dart';
import 'package:changer/app/utils/components/dashboard_button%20copy.dart';
import 'package:changer/app/utils/components/home_dashboard_button.dart';
import 'package:changer/app/utils/routes.dart';
import 'package:changer/app/views/user/accounting_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyAccount extends StatefulWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  State<MyAccount> createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
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
            children: [
              const BalanceTile(heldBalance: '100', availableBalance: '200'),
              DashBoardButton(
                  icon: 'assets/images/profile.svg',
                  label: 'Personal Info',
                  onTap: () => {}),
              DashBoardButton(
                icon: 'assets/images/order.svg',
                label: 'Order Record',
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccountingDetailsScreen(),
                    )),
              ),
              DashBoardButton(
                  icon: 'assets/images/account.svg',
                  label: 'Accounting Details',
                  onTap: () => Get.toNamed(Routes.accountingDetails)),
              DashBoardButton(
                icon: 'assets/images/team.svg',
                label: 'Team',
                onTap: () => Get.toNamed(Routes.teamReport),
              ),
              DashBoardButton(
                icon: 'assets/images/recharge.svg',
                label: 'Recharge Reports',
                onTap: () => Get.toNamed(Routes.rechargeReports),
              ),
              DashBoardButton(
                icon: 'assets/images/invite.svg',
                label: 'Friends Invitations',
                onTap: () => Get.toNamed(Routes.invitation),
              ),
            ],
          )),
    );
  }
}
