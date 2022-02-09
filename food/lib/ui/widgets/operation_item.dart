import 'package:flutter/material.dart';
import 'package:food/core/extension/int_extension.dart';

class GOOperationItem extends StatelessWidget {
  final Widget _icon;
  final String _title;

  GOOperationItem(this._icon, this._title);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _icon,
        SizedBox(
          width: 3.px,
        ),
        Text(_title)
      ],
    );
  }
}
