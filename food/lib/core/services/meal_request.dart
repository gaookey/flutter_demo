import 'package:food/core/model/meal_model.dart';
import 'package:food/core/services/http_request.dart';

class GoMealRequest {
  static Future<List<GoMealModel>> getMealData() async {
    final url = "meal";
    final result = await HttpRequest.request(url);

    final mealArray = result["meal"];
    List<GoMealModel> meals = [];
    for (var json in mealArray) {
      meals.add(GoMealModel.fromJson(json));
    }
    return meals;
  }
}
