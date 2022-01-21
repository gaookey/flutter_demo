import 'package:flutter/material.dart';
import 'initialize_items.dart';

class GoMainPage extends StatefulWidget {
  const GoMainPage({Key? key}) : super(key: key);

  @override
  _GoMainPageState createState() => _GoMainPageState();
}

class _GoMainPageState extends State<GoMainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(index: _currentIndex, children: pages),
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 14,
          unselectedFontSize: 14,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          items: items,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ));
  }
}
