import 'package:avsarmlm/app/utils/colors.dart';
import 'package:avsarmlm/app/utils/sizes.dart';
import 'package:avsarmlm/app/views/guest/login_page.dart';
import 'package:avsarmlm/app/views/guest/signup_page.dart';
import 'package:avsarmlm/app/views/user/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      textStyle: TextStyle(fontSize: AppSizes.percentWidth(2)),
      icon: icon,
      title: (title),
      activeColorPrimary:primaryColor,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    );
  }

  List<Widget> tabScreen = [
    const HomePage(), //Home
    const HomePage(), //My Transactions
    const HomePage(), //Notifications
    const HomePage(), //My Account
  ];

  get getcurrentIndex => currentIndex;
  changeCurrentIndex(int index) {
    currentIndex.value = index;
    persistentTabController.index = index;
  }
}
