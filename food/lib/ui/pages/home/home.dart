import 'package:flutter/material.dart';
import 'package:food/ui/pages/home/home_app_bar.dart';
import 'package:food/ui/pages/home/home_content.dart';

class GoHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HOHomeAppBar(context),
      body: GoHomeContentPage(),
    );
  }
}
