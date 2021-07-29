import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zhihu_daily/common/widgets/page_route_anim.dart';
import 'package:zhihu_daily/ui/pages/login_page.dart';
import 'package:zhihu_daily/ui/pages/main_page.dart';
import 'package:zhihu_daily/ui/pages/splash_page.dart';

class RouterNames {
  static const String splash = "splash";
  static const String main = "/";
  static const String login = "login";
}

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouterNames.splash:
        return NoAnimRouteBuilder(SplashPage());
      case RouterNames.main:
        return FadeRouteBuilder(MainPage());
      case RouterNames.login:
        return FadeRouteBuilder(LoginPage());
      default :
        return FadeRouteBuilder(MainPage());
    }
  }
}
