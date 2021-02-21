import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollableContainer extends StatelessWidget {
  const ScrollableContainer({this.maxHeight = 200, @required this.child});
  final double maxHeight;
  final Widget child;

  @override
  Widget build(BuildContext context) => ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: Scrollbar(
          child: child,
        ),
      );
}
