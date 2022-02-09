import 'package:flutter/material.dart';
import 'package:food/core/model/category_model.dart';
import 'package:food/core/extension/int_extension.dart';
import 'package:food/ui/pages/meal/meal.dart';

class GoHomeCategoryItem extends StatelessWidget {
  final GoCategoryModel _categoryModel;

  GoHomeCategoryItem(this._categoryModel);

  @override
  Widget build(BuildContext context) {
    final bgColor = _categoryModel.cColor;

    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12.px),
            // 渐变色
            gradient:
                LinearGradient(colors: [bgColor.withOpacity(0.5), bgColor])),
        alignment: Alignment.center,
        child: Text(
          _categoryModel.title ?? "",
          style: Theme.of(context)
              .textTheme
              .headline2!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, GOMealPage.routeName,
            arguments: _categoryModel);
      },
    );
  }
}
