import 'package:flutter/material.dart';
import 'package:food/core/model/category_model.dart';
import 'package:food/ui/pages/meal/meal_content.dart';

class GOMealPage extends StatelessWidget {
  static const String routeName = "/meal";

  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context)?.settings.arguments as GoCategoryModel;



    return Scaffold(
      appBar: AppBar(
        title: Text(category.title ?? ""),
      ),
      body: GOMealContentPage(),
    );
  }
}
