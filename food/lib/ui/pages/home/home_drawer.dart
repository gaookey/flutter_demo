import 'package:flutter/material.dart';
import 'package:food/core/extension/int_extension.dart';
import 'package:food/ui/pages/filter/filter.dart';

class GOHomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 350,
        child: Drawer(
          child: Column(
            children: [
              buildHeaderView(context),
              buildListTile(Icon(Icons.restaurant), "进餐", () {
                Navigator.pop(context);
              }),
              buildListTile(Icon(Icons.settings), "过滤", () {
                Navigator.pushNamed(context, GOFilterPage.routeName);
              }),
            ],
          ),
        ));
  }

  Widget buildHeaderView(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120.px,
      color: Colors.cyan,
      alignment: Alignment(0, 0.5),
      child: Text(
        "侧边栏",
        style: Theme.of(context)
            .textTheme
            .headline3
            ?.copyWith(fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  Widget buildListTile(Widget icon, String title, GestureTapCallback? onTap) {
    return ListTile(
      leading: icon,
      title: Text(title),
      onTap: onTap,
    );
  }
}
