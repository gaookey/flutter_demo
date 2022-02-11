import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food/core/model/meal_model.dart';
import 'package:food/core/viewmodel/favor_view_model.dart';
import 'package:food/ui/widgets/meal_item.dart';
import 'package:provider/provider.dart';

class GOFavorContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<GOFavorViewModel>(builder: (context, favorVM, child) {
      return ListView.builder(
          itemCount: favorVM.favorMeals.length,
          itemBuilder: (context, index) {
            return GOMealItem(favorVM.favorMeals[index]);
          });
    });
  }
}
