import 'package:flutter/material.dart';
import 'package:food/core/extension/int_extension.dart';

class GOOperationItem extends StatelessWidget {
  final Widget _icon;
  final String _title;
  final Color textColor;

  GOOperationItem(this._icon, this._title, {this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (MediaQuery.of(context).size.width - 80.px) / 3,
      padding: EdgeInsets.symmetric(vertical: 12.px),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _icon,
          SizedBox(
            width: 3.px,
          ),
          Text(
            _title,
            style: TextStyle(color: textColor),
          )
        ],
      ),
    );
  }
}
