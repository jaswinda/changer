import 'package:changer/app/utils/routes.dart';
import 'package:changer/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/route_middleware.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (sharedprefs!.getString('token') == null) {
      return const RouteSettings(name: Routes.login);
    }
  }
}
