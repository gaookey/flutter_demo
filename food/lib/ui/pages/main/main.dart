import 'package:flutter/material.dart';
import 'package:food/ui/pages/home/home_drawer.dart';
import 'package:food/ui/pages/main/initialize_items.dart';

class GoMainPage extends StatefulWidget {
  static const String routeName = "/";

  @override
  _GoMainPageState createState() => _GoMainPageState();
}

class _GoMainPageState extends State<GoMainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GOHomeDrawer(),
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: items,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
