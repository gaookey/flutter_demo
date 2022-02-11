import 'package:flutter/material.dart';
import 'package:food/core/model/meal_model.dart';
import 'package:food/core/viewmodel/favor_view_model.dart';
import 'package:food/ui/pages/detail/detail_content.dart';
import 'package:provider/provider.dart';

class GODetailPage extends StatelessWidget {
  static const String routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as GoMealModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title ?? ""),
      ),
      body: GODetailContent(meal),
      floatingActionButton: Consumer<GOFavorViewModel>(
        builder: (context, favorVM, child) {
          final icon =
              favorVM.isFavor(meal) ? Icons.favorite : Icons.favorite_border;
          return FloatingActionButton(
            child: Icon(icon),
            onPressed: () {
              favorVM.handleMeal(meal);
            },
          );
        },
      ),
    );
  }
}
