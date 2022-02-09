import 'package:flutter/material.dart';
import 'package:food/ui/pages/home/home.dart';
import 'package:food/ui/pages/main/main.dart';
import 'package:food/ui/pages/unknown_page.dart';

class GORouter {
  static final initialRoute = GoMainPage.routeName;

  static final Map<String, WidgetBuilder> routes = {
    GoMainPage.routeName: (context) => GoMainPage(),
    // AboutPage.routeName: (context) => AboutPage()
  };

  static final RouteFactory generateRoute = (settings) {
    // if (settings.name == DetailPage.routeName) {
    //   return MaterialPageRoute(builder: (context) => DetailPage(settings.arguments as UserInfo));
    // }
    return null;
  };

  static final RouteFactory unknownRoute = (setting) {
    return MaterialPageRoute(builder: (context) => UnknownPage());
  };
}
