import 'package:changer/app/middlewares/auth_middleware.dart';
import 'package:changer/app/views/user/add_withdraw_methd.dart';
import 'package:changer/app/views/guest/login_page.dart';
import 'package:changer/app/views/user/accounting_details_screen.dart';
import 'package:changer/app/views/user/deposit_screen.dart';
import 'package:changer/app/views/user/invitation_screen.dart';
import 'package:changer/app/views/user/order_records_screen.dart';
import 'package:changer/app/views/user/recharge_record_screen.dart';
import 'package:changer/app/views/user/select_widraw_method.dart';
import 'package:changer/app/views/user/tab_screen/tab_screen_page.dart';
import 'package:changer/app/views/user/team_reports_screen.dart';
import 'package:changer/app/views/user/withdraw_screen.dart';
import 'package:get/get.dart';

class Routes {
  static const String home = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String orderRecord = '/order-record';
  static const String accountingDetails = '/accounting-details';
  static const String withdraw = '/withdraw';
  static const String addWithdrawMethod = '/add-withdraw-method';
  static const String selectWithdrawMethod = '/select-withdraw-method';
  static const String deposit = '/deposit';
  static const String teamReport = '/team-report';
  static const String rechargeReports = '/recharge-reports';
  static const String invitation = '/invitation';

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
    GetPage(
        name: orderRecord,
        page: () => const OrderRecordsScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: accountingDetails,
        page: () => const AccountingDetailsScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: withdraw,
        page: () => WithdrawScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: deposit,
        page: () => const DepositScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: addWithdrawMethod,
        page: () => AddWithdraw(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: selectWithdrawMethod,
        page: () => const SelectWithdrawMethod(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: teamReport,
        page: () => const TeamReportScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: rechargeReports,
        page: () => const RechargeRecord(),
        middlewares: [AuthMiddleware()]),
    GetPage(
        name: invitation,
        page: () => const InvitationScreen(),
        middlewares: [AuthMiddleware()]),
    GetPage(name: login, page: () => LoginPage()),
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
