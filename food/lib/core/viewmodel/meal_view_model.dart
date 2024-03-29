import 'package:flutter/material.dart';
import 'package:food/core/model/meal_model.dart';
import 'package:food/core/services/meal_request.dart';
import 'package:food/core/viewmodel/filter_view_model.dart';

class GOMealViewModel extends ChangeNotifier {
  List<GoMealModel> _meals = [];

  GOFilterViewModel? _filterVM;

  List<GoMealModel> get meals {
    return _meals.where((element) {
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

  GOMealViewModel() {
    GoMealRequest.getMealData().then((value) {
      _meals = value;
      notifyListeners();
    });
  }

  set filterVM(GOFilterViewModel value) {
    _filterVM = value;
  }
}
