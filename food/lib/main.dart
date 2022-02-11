import 'package:flutter/material.dart';
import 'package:food/core/router/route.dart';
import 'package:food/core/viewmodel/favor_view_model.dart';
import 'package:food/core/viewmodel/filter_view_model.dart';
import 'package:food/core/viewmodel/meal_view_model.dart';
import 'package:food/ui/shared/app_theme.dart';
import 'package:food/ui/shared/size_fit.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(MultiProvider(providers: providers, child: MyApp()));
}

List<SingleChildWidget> providers = [

  ChangeNotifierProvider(create: (context) => GOFilterViewModel()),
  // GOFilterViewModel 需要依赖的
  // 使用 ChangeNotifierProxyProvider 需要注意和 ChangeNotifierProvider 的顺序
  ChangeNotifierProxyProvider<GOFilterViewModel, GOMealViewModel>(
      create: (context) => GOMealViewModel(),
      update: (context, filterVM, mealVM) {
        mealVM?.filterVM = filterVM;
        return mealVM!;
      }),
  ChangeNotifierProxyProvider<GOFilterViewModel, GOFavorViewModel>(
      create: (context) => GOFavorViewModel(),
      update: (context, filterVM, favorVM) {
        favorVM?.filterVM = filterVM;
        return favorVM!;
      }),
];

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
