import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/ui/pages/favor/favor.dart';
import 'package:food/ui/pages/home/home.dart';

final List<Widget> pages = [GoHomePage(), GoFavorPage()];

final List<BottomNavigationBarItem> items = [
  BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
  BottomNavigationBarItem(icon: Icon(Icons.star), label: "收藏")
];
