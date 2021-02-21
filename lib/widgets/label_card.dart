import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'generals/decoration.dart';

typedef void MemoCardFunc();

class LabelCard extends StatelessWidget {
  LabelCard(this._text);
  final String _text;

  @override
  Widget build(BuildContext context) => Container(
        padding:
            EdgeInsets.all(Theme.of(context).textTheme.bodyText1.fontSize / 2),
        child: Text(
          _text,
          textAlign: TextAlign.center,
        ),
        width: double.infinity,
        decoration: BorderDecoration(
          context,
          color: Theme.of(context).backgroundColor,
        ),
      );
}
