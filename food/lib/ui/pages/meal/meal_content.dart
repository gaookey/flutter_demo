import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food/core/model/category_model.dart';
import 'package:food/core/model/meal_model.dart';
import 'package:food/core/viewmodel/meal_view_model.dart';
import 'package:food/ui/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class GOMealContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category =
        ModalRoute.of(context)?.settings.arguments as GoCategoryModel;

    return Selector<GOMealViewModel, List<GoMealModel>>(
        shouldRebuild: (prev, next) => !listEquals(prev, next),
        builder: (context, meals, child) {
          return ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) {
                return GOMealItem(meals[index]);
              });
        },
        selector: (context, mealVM) => mealVM.meals
            .where((element) => element.categories!.contains(category.id))
            .toList());
  }
}

// class GOMealContentPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final category =
//         ModalRoute.of(context)?.settings.arguments as GoCategoryModel;
//
//     return Consumer<GOMealViewModel>(builder: (context, mealVM, child) {
//       final meals = mealVM.meals.where((meal) => meal.categories!.contains(category.id)).toList();
//       return Text("data");
//     });
//   }
// }
