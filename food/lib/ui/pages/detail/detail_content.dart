import 'package:flutter/material.dart';
import 'package:food/core/model/meal_model.dart';
import 'package:food/core/extension/int_extension.dart';

class GODetailContent extends StatelessWidget {
  final GoMealModel _mealModel;

  GODetailContent(this._mealModel);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          buildBannerImage(),
          buildTitle(context, "制作材料"),
          buildMakeMaterial(context),
          buildTitle(context, "步骤"),
          buildMakeSteps(context)
        ],
      ),
    );
  }

  Widget buildBannerImage() {
    return Container(
      // Column 交叉轴的宽度默认不是屏幕的宽度，而是最大子 Widget 的宽度。需要为 Column 的某个子 Widget 设置最大屏幕宽度。
      width: double.infinity,
      child: Image.network(_mealModel.imageUrl ?? ""),
    );
  }

  Widget buildMakeMaterial(BuildContext context) {
    return buildContainer(
        context: context,
        child: ListView.builder(
            // 关闭内边距
            padding: EdgeInsets.zero,
            // 通常 ListView 都会尽可能的填充满 parent 组件给的空间大小. 而 shrinkWrap: true 则是只满足自身大小。
            shrinkWrap: true,
            // 关闭滚动
            physics: NeverScrollableScrollPhysics(),
            itemCount: _mealModel.ingredients!.length,
            itemBuilder: (context, index) {
              return Card(
                color: Theme.of(context).colorScheme.secondary,
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.px, vertical: 5.px),
                    child: Text(_mealModel.ingredients![index])),
              );
            }));
  }

  Widget buildMakeSteps(BuildContext context) {
    return buildContainer(
        context: context,
        child: ListView.separated(
          // 关闭内边距
          padding: EdgeInsets.zero,
          // 通常 ListView 都会尽可能的填充满 parent 组件给的空间大小. 而 shrinkWrap: true 则是只满足自身大小。
          shrinkWrap: true,
          // 关闭滚动
          physics: NeverScrollableScrollPhysics(),
          itemCount: _mealModel.steps!.length,
          itemBuilder: (context, index) {
            return ListTile(
              // 圆形图像
              leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.secondary, child: Text("#${index + 1}")),
              title: Text(_mealModel.steps![index]),
            );
          },
          separatorBuilder: (context, index) {
            // 分割线
            return Divider();
          },
        ));
  }

  Widget buildTitle(BuildContext context, String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.px, horizontal: 5.px),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline3
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildContainer(
      {required BuildContext context, required Widget child}) {
    return Container(
      padding: EdgeInsets.all(10.px),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.px),
        color: Colors.white,
      ),
      width: MediaQuery.of(context).size.width - 30.px,
      child: child,
    );
  }
}
