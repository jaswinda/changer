import 'package:avsarmlm/app/middlewares/auth_middleware.dart';
import 'package:avsarmlm/app/views/guest/login_page.dart';
import 'package:avsarmlm/app/views/user/home_page.dart';
import 'package:avsarmlm/app/views/user/tab_screen/tab_screen_page.dart';
import 'package:get/get.dart';

class Routes {
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String dashboard = '/dashboard';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String changePassword = '/change-password';
  static const String manageUsers = '/manage-users';
  static const String manageProducts = '/manage-products';
  static const String manageOrders = '/manage-orders';
  static const String productDetail = '/product-detail';
  static const String cart = '/cart';
  static const String orderDetail = '/order-detail';

  List<GetPage<dynamic>>? getPages = [
    GetPage(
        name: home,
        page: () => const TabScreenPage(),
        middlewares: [AuthMiddleware()]),
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: register, page: () => LoginPage()),
    GetPage(name: forgotPassword, page: () => LoginPage()),
    GetPage(name: dashboard, page: () => LoginPage()),
    GetPage(name: profile, page: () => LoginPage()),
    GetPage(name: settings, page: () => LoginPage()),
    GetPage(name: changePassword, page: () => LoginPage()),
    GetPage(name: manageUsers, page: () => LoginPage()),
    GetPage(name: manageProducts, page: () => LoginPage()),
    GetPage(name: manageOrders, page: () => LoginPage()),
    GetPage(name: productDetail, page: () => LoginPage()),
    GetPage(name: cart, page: () => LoginPage()),
    GetPage(name: orderDetail, page: () => LoginPage()),
  ];
}