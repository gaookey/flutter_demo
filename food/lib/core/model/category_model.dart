import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GoCategoryModel {
  String? id;
  String? title;
  String? color;
  Color cColor = Colors.transparent;

  GoCategoryModel({this.id, this.title, this.color});

  GoCategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    color = json['color'];

    // 转成16进制
    final colorInt = int.parse(color ?? "", radix: 16);
    // 添加透明度
    cColor = Color(colorInt | 0xFF000000);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['color'] = this.color;
    return data;
  }
}
