import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:food/core/model/category_model.dart';

class JsonParse {
  static Future<List<GoCategoryModel>> getCategoryData() async {
    final jsonString = await rootBundle.loadString("assets/json/category.json");

    final result = json.decode(jsonString);

    final resultList = result["category"];
    List<GoCategoryModel> categories = [];
    for (var json in resultList) {
      categories.add(GoCategoryModel.fromJson(json));
    }

    return categories;
  }
}
