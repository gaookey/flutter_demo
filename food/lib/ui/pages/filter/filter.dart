import 'package:flutter/material.dart';
import 'package:food/ui/pages/filter/fileter_content.dart';

class GOFilterPage extends StatelessWidget {
  static const String routeName = "/filter";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("美食过滤"),
        ),
        body: GOFilterContentPage());
  }
}
