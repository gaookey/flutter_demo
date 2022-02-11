import 'package:flutter/material.dart';
import 'package:food/core/model/meal_model.dart';
import 'package:food/core/viewmodel/filter_view_model.dart';

class GOFavorViewModel extends ChangeNotifier {
  List<GoMealModel> _favorMeals = [];

  GOFilterViewModel? _filterVM;

  List<GoMealModel> get favorMeals {
    return _favorMeals.where((element) {
      if (_filterVM != null) {
        if (_filterVM!.isGlutenFree && element.isGlutenFree == false)
          return false;
        if (_filterVM!.isLactoseFree && element.isLactoseFree == false)
          return false;
        if (_filterVM!.isVegetarian && element.isVegetarian == false)
          return false;
        if (_filterVM!.isVegan && element.isVegan == false) return false;
      }

      return true;
    }).toList();
  }

  void addMeal(GoMealModel model) {
    _favorMeals.add(model);
    notifyListeners();
  }

  void removeMeal(GoMealModel model) {
    _favorMeals.remove(model);
    notifyListeners();
  }

  bool isFavor(GoMealModel model) {
    return _favorMeals.contains(model);
  }

  void handleMeal(GoMealModel model) {
    if (isFavor(model)) {
      removeMeal(model);
    } else {
      addMeal(model);
    }
  }

  set filterVM(GOFilterViewModel value) {
    _filterVM = value;
  }
}
