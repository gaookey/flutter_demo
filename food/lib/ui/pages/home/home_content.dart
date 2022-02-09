import 'package:flutter/material.dart';
import 'package:food/core/model/category_model.dart';
import 'package:food/core/services/json_parse.dart';
import 'package:food/core/extension/int_extension.dart';
import 'package:food/ui/pages/home/home_category_item.dart';

class GoHomeContentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<GoCategoryModel>>(
        future: JsonParse.getCategoryData(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.error != null) {
            return Center(
              child: Text("请示失败"),
            );
          }

          final _categories = snapshot.data!;

          return GridView.builder(
            padding: EdgeInsets.all(20.px),
            itemCount: _categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.px,
                mainAxisSpacing: 20.px,
                childAspectRatio: 1.5),
            itemBuilder: (context, index) {
              return GoHomeCategoryItem(_categories[index]);
            },
          );
        });
  }
}
