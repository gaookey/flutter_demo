import 'package:flutter/material.dart';

class GoBottomBarItem extends BottomNavigationBarItem {
  GoBottomBarItem(String title, String iconName)
      : super(
            label: title,
            icon: Image.asset("assets/images/tabbar/$iconName.png",
                width: 30, height: 30, gaplessPlayback: true),
            activeIcon: Image.asset(
                "assets/images/tabbar/${iconName}_active.png",
                width: 30,
                height: 30,
                gaplessPlayback: true));
}
