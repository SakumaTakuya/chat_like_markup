import 'package:flutter/cupertino.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class TextFromMarkdown extends StatelessWidget {
  TextFromMarkdown(this.data, {this.physics, this.selectable = false})
      : assert(data != null);
  final String data;
  final ScrollPhysics physics;
  final bool selectable;

  @override
  Widget build(BuildContext context) => Markdown(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        data: data,
        physics: physics,
        selectable: selectable,
      );
}
