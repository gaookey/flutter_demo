import 'package:flutter/material.dart';
import 'package:food/core/router/route.dart';
import 'package:food/core/viewmodel/meal_view_model.dart';
import 'package:food/ui/shared/app_theme.dart';
import 'package:food/ui/shared/size_fit.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => GOMealViewModel(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GoSizeFit.initialize();

    return MaterialApp(
      title: '美食APP',

      // 主题
      theme: GoAppTheme.normalTheme,
      darkTheme: GoAppTheme.darkTheme,

      // 路由
      initialRoute: GORouter.initialRoute,
      routes: GORouter.routes,
      onGenerateRoute: GORouter.generateRoute,
      onUnknownRoute: GORouter.unknownRoute,
    );
  }
}
