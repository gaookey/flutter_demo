import 'package:flutter/cupertino.dart';
import 'package:food/core/model/meal_model.dart';
import 'package:food/core/services/meal_request.dart';

class GOMealViewModel extends ChangeNotifier {
  List<GoMealModel> _meals = [];

  List<GoMealModel> get meals {
    return _meals;
  }

  GOMealViewModel() {
    GoMealRequest.getMealData().then((value) {
      _meals = value;
      notifyListeners();
    });
  }
}
