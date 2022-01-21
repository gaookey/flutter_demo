import 'package:flutter/material.dart';

import '../home/home.dart';
import '../group/group.dart';
import '../subject/subject.dart';
import '../mall/mall.dart';
import '../profile/profile.dart';

import 'bottom_bar_item.dart';

List<GoBottomBarItem> items = [
  GoBottomBarItem("首页", "home"),
  GoBottomBarItem("书影音", "subject"),
  GoBottomBarItem("小组", "group"),
  GoBottomBarItem("市集", "mall"),
  GoBottomBarItem("我的", "profile"),
];

List<Widget> pages = [
  GoHomePage(),
  GoSubjectPage(),
  GoGroupPage(),
  GoMallPage(),
  GoProfilePage()
];
