import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../infras/widgets/markdown.dart';

typedef void ParagraphCardCallback();

class ParagraphCard extends StatelessWidget {
  ParagraphCard({
    Key key,
    @required this.text,
    @required this.color,
    @required this.onTap,
    @required this.onAdded,
  }) : super(key: key);

  final String text;
  final Color color;
  final ParagraphCardCallback onTap;
  final ParagraphCardCallback onAdded;

  @override
  Widget build(BuildContext context) => Card(
        margin: const EdgeInsets.symmetric(vertical: 1.0),
        child: InkWell(
          onTap: onTap,
          child: Container(
            color: color,
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextFromMarkdown(
                    text,
                    physics: NeverScrollableScrollPhysics(),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
