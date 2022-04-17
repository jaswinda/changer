import 'package:avsarmlm/app/utils/colors.dart';
import 'package:avsarmlm/app/utils/components/balance_tile.dart';
import 'package:avsarmlm/app/utils/components/dashboard_button.dart';
import 'package:avsarmlm/app/utils/routes.dart';
import 'package:avsarmlm/app/utils/sizes.dart';
import 'package:avsarmlm/app/utils/transition.dart';
import 'package:avsarmlm/app/views/user/accounting_details_screen.dart';
import 'package:avsarmlm/app/views/user/order_records_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
            children: [
              const BalanceTile(heldBalance: '100', availableBalance: '200'),
              Padding(
                padding: EdgeInsets.all(AppSizes.percentWidth(3)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    roundButton(
                        label: 'Withdraw',
                        onPressed: () => Get.toNamed(Routes.withdraw)),
                    roundButton(
                        label: 'Deposit',
                        onPressed: () => Get.toNamed(Routes.accountingDetails)),
                  ],
                ),
              ),
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
                onTap: () => {},
              ),
              DashBoardButton(
                icon: 'assets/images/recharge.svg',
                label: 'Recharge Reports',
                onTap: () => {},
              ),
              DashBoardButton(
                icon: 'assets/images/invite.svg',
                label: 'Friends Invitations',
                onTap: () => {},
              ),
            ],
          )),
    );
  }

  Widget roundButton({required String label, required Function onPressed}) {
    return InkWell(
      onTap: () => onPressed(),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            //shadow
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10.0, // has the effect of softening the shadow
              )
            ],
            color: primaryColor),
        child: Padding(
          padding: EdgeInsets.all(AppSizes.percentWidth(3)),
          child: Text(label, style: const TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
