import 'package:flutter/material.dart';
import 'package:food/ui/pages/detail/detail.dart';
import 'package:food/ui/pages/filter/filter.dart';
import 'package:food/ui/pages/home/home.dart';
import 'package:food/ui/pages/main/main.dart';
import 'package:food/ui/pages/meal/meal.dart';
import 'package:food/ui/pages/unknown_page.dart';

class GORouter {
  static final initialRoute = GoMainPage.routeName;

  static final Map<String, WidgetBuilder> routes = {
    GoMainPage.routeName: (context) => GoMainPage(),
    GOMealPage.routeName: (context) => GOMealPage(),
    GODetailPage.routeName: (context) => GODetailPage()
  };

  static final RouteFactory generateRoute = (settings) {
    if (settings.name == GOFilterPage.routeName) {
      return MaterialPageRoute(
          builder: (context) => GOFilterPage(),
          // 更改默认弹出方式
          fullscreenDialog: true);
    }
    return null;
  };

  static final RouteFactory unknownRoute = (setting) {
    return MaterialPageRoute(builder: (context) => UnknownPage());
  };
}
