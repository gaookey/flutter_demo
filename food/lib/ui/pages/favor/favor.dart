import 'package:flutter/material.dart';
import 'package:food/ui/pages/favor/favor_content.dart';

class GoFavorPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("收藏"),
      ),
      body: Center(
        child: GOFavorContentPage(),
      ),
    );
  }
}
