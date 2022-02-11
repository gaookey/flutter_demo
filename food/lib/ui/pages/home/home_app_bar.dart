import 'package:flutter/material.dart';

class HOHomeAppBar extends AppBar {
  HOHomeAppBar(BuildContext context) : super (
    title: Text("美食广场"),
    leading: IconButton(
      icon: Icon(Icons.add_business),
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
    ),
  );
}