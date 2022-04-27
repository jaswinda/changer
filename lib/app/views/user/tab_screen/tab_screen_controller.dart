import 'package:changer/app/utils/colors.dart';
import 'package:changer/app/utils/sizes.dart';
import 'package:changer/app/views/guest/login_page.dart';
import 'package:changer/app/views/guest/signup_page.dart';
import 'package:changer/app/views/user/accounting_details_screen.dart';
import 'package:changer/app/views/user/home_page.dart';
import 'package:changer/app/views/user/my_account.dart';
import 'package:changer/app/views/user/team_reports_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class TabScreenController extends GetxController {
  var currentIndex = 0.obs;
  var isCurrentUserBuyer = true.obs;
  PageController pageController = PageController();

  PersistentTabController persistentTabController =
      PersistentTabController(initialIndex: 0);

  List<PersistentBottomNavBarItem> navBarsItems() {
    return [
      tabItem(
        'Home',
        icon: const Icon(
          Icons.home_outlined,
        ),
      ),
      tabItem(
        'My Transactions',
        icon: const Icon(Icons.account_balance_wallet_outlined),
      ),
      tabItem(
        'Grab',
        icon: SvgPicture.asset(
          'assets/images/grab.svg',
          color: Colors.white,
          width: AppSizes.percentWidth(5),
          height: AppSizes.percentHeight(5),
        ),
      ),
      tabItem('Notifications', icon: const Icon(Icons.notifications_outlined)),
      tabItem('My Account', icon: const Icon(Icons.account_circle_outlined)),
    ];
  }

  setCurrentUserToSeller() {
    isCurrentUserBuyer.value = false;
  }

  setCurrentUserToBuyer() {
    isCurrentUserBuyer.value = true;
  }

  PersistentBottomNavBarItem tabItem(title, {required Widget icon, screen}) {
    return PersistentBottomNavBarItem(
      textStyle: TextStyle(
          fontSize: AppSizes.percentWidth(2.5),
          color: Colors.black,
          fontWeight: FontWeight.bold),
      icon: icon,
      title: (title),
      activeColorPrimary: primaryColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    );
  }

  List<Widget> tabScreen = [
    const HomePage(), //Home
    const AccountingDetailsScreen(), //My Transactions
    const MyAccount(), //My Transactions
    const MyAccount(), //Notifications
    const MyAccount(), //My Account
  ];

  get getcurrentIndex => currentIndex;
  changeCurrentIndex(int index) {
    currentIndex.value = index;
    persistentTabController.index = index;
  }
}
