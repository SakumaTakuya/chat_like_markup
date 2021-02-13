import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BorderDecoration extends BoxDecoration {
  BorderDecoration(BuildContext context, {Color color})
      : super(
          border: Border(
            bottom: BorderSide(
              width: 1.0,
              color: Theme.of(context).dividerColor,
            ),
          ),
          color: color,
        );
}
