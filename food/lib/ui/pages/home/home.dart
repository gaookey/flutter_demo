import 'package:flutter/material.dart';
import 'package:food/ui/pages/home/home_content.dart';

class GoHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("美食广场"),
      ),
      body: GoHomeContentPage(),
    );
  }
}
