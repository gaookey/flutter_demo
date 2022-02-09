import 'package:flutter/material.dart';
import 'package:food/core/model/category_model.dart';
import 'package:food/core/services/json_parse.dart';
import 'package:food/core/extension/int_extension.dart';

class GoHomeContentPage extends StatefulWidget {
  @override
  _GoHomeContentPageState createState() => _GoHomeContentPageState();
}

class _GoHomeContentPageState extends State<GoHomeContentPage> {
  List<GoCategoryModel> _categories = [];

  @override
  void initState() {
    super.initState();

    JsonParse.getCategoryData().then((value) {
      _categories = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(20.px),
      itemCount: _categories.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20.px,
          mainAxisSpacing: 20.px,
          childAspectRatio: 1.5),
      itemBuilder: (context, index) {
        final bgColor = _categories[index].cColor;

        return Container(
          decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12.px),
              // 渐变色
              gradient:
                  LinearGradient(colors: [bgColor.withOpacity(0.5), bgColor])),
          alignment: Alignment.center,
          child: Text(
            _categories[index].title ?? "",
            style: Theme.of(context).textTheme.headline2,
          ),
        );
      },
    );
  }
}
