import 'package:flutter/material.dart';
import 'package:food/core/router/route.dart';
import 'package:food/ui/shared/app_theme.dart';
import 'package:food/ui/shared/size_fit.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GoSizeFit.initialize();

    return MaterialApp(
      title: '美食APP',

      // 主题
      theme: GoAppTheme.normalTheme,

      // 路由
      darkTheme: GoAppTheme.darkTheme,
      initialRoute: GORouter.initialRoute,
      routes: GORouter.routes,
      onGenerateRoute: GORouter.generateRoute,
      onUnknownRoute: GORouter.unknownRoute,
    );
  }
}
