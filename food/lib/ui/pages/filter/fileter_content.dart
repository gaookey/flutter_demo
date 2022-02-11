import 'package:flutter/material.dart';
import 'package:food/core/extension/int_extension.dart';
import 'package:food/core/viewmodel/filter_view_model.dart';
import 'package:provider/provider.dart';

class GOFilterContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [buildTitle(context), buildSelect(context)],
    );
  }

  Widget buildTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.px),
      alignment: Alignment.center,
      child: Text(
        "展示你的选择",
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }

  Widget buildSelect(BuildContext context) {
    return Expanded(
      child: Consumer<GOFilterViewModel>(
        builder: (context, filterVM, child) {
          return ListView(
            children: [
              buildListTile(context, filterVM.isGlutenFree, "五谷蛋白", "展示五谷蛋白食物",
                  (value) {
                filterVM.isGlutenFree = value;
              }),
              buildListTile(context, filterVM.isLactoseFree, "不含乳糖", "展示不含乳糖食物",
                  (value) {
                filterVM.isLactoseFree = value;
              }),
              buildListTile(
                  context, filterVM.isVegetarian, "普通素食者", "展示普通素食相关食物",
                  (value) {
                filterVM.isVegetarian = value;
              }),
              buildListTile(context, filterVM.isVegan, "严格素食者", "展示严格素食相关食物",
                  (value) {
                filterVM.isVegan = value;
              }),
            ],
          );
        },
      ),
    );
  }

  Widget buildListTile(BuildContext context, bool value, String title,
      String subtitle, ValueChanged function) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: Switch(value: value, onChanged: function),
    );
  }
}
