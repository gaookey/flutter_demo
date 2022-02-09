import 'package:flutter/material.dart';
import 'package:food/core/model/meal_model.dart';

class GODetailPage extends StatelessWidget {
  static const String routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as GoMealModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title ?? ""),
      ),
      body: Text("d"),
    );
  }
}
