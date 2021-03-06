import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../infras/widgets/markdown.dart';

class PreviewScreen extends StatelessWidget {
  PreviewScreen({@required this.text});
  final String text;

  @override
  Widget build(BuildContext context) => Container(
        padding: EdgeInsets.all(16.0),
        child: TextFromMarkdown(
          text,
          selectable: true,
        ),
      );
}
