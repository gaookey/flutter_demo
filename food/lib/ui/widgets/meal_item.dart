import 'package:flutter/material.dart';
import 'package:food/core/model/meal_model.dart';
import 'package:food/core/extension/int_extension.dart';
import 'package:food/core/viewmodel/favor_view_model.dart';
import 'package:food/ui/pages/detail/detail.dart';
import 'package:food/ui/widgets/operation_item.dart';
import 'package:provider/provider.dart';

class GOMealItem extends StatelessWidget {
  final GoMealModel _mealModel;

  GOMealItem(this._mealModel);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        // 间距
        margin: EdgeInsets.all(10.px),
        // 阴影
        elevation: 5,
        // 圆角
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.px)),
        child: Column(
          children: [buildBasicInfo(context), buildOperationInfo()],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, GODetailPage.routeName,
            arguments: _mealModel);
      },
    );
  }

  Widget buildBasicInfo(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.px),
              topRight: Radius.circular(12.px)),
          child: Image.network(
            _mealModel.imageUrl ?? "",
            width: double.infinity,
            height: 250.px,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          right: 10.px,
          bottom: 10.px,
          child: Container(
            width: 300,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(6.px)),
            child: Text(
              _mealModel.title ?? "",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        )
      ],
    );
  }

  Widget buildOperationInfo() {
    return Padding(
      padding: EdgeInsets.all(5.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GOOperationItem(Icon(Icons.schedule), "${_mealModel.duration}分钟"),
          GOOperationItem(
              Icon(Icons.restaurant), "${_mealModel.complexityString}"),
          buildFavorItem()
        ],
      ),
    );
  }

  Widget buildFavorItem() {
    return Consumer<GOFavorViewModel>(builder: (context, favorVM, child) {
      final icon =
          favorVM.isFavor(_mealModel) ? Icons.favorite : Icons.favorite_border;
      final color = favorVM.isFavor(_mealModel) ? Colors.red : Colors.black;
      final title = favorVM.isFavor(_mealModel) ? "已收藏" : "收藏";

      return GestureDetector(
        child: GOOperationItem(
          Icon(
            icon,
            color: color,
          ),
          title,
          textColor: color,
        ),
        onTap: () {
          favorVM.handleMeal(_mealModel);
        },
      );
    });
  }
}
