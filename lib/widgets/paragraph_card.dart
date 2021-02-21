import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../infras/widgets/markdown.dart';

typedef void ParagraphCardCallback();
typedef bool ConfirmDismissCallback();

class ParagraphCard extends StatelessWidget {
  ParagraphCard({
    Key key,
    @required this.text,
    @required this.color,
    @required this.onTap,
    @required this.confirmDismiss,
  }) : super(key: key);

  final String text;
  final Color color;
  final ParagraphCardCallback onTap;
  final ConfirmDismissCallback confirmDismiss;

  @override
  Widget build(BuildContext context) => Dismissible(
        key: Key('${this.hashCode}-content'),
        direction: DismissDirection.startToEnd,
        confirmDismiss: (direction) async => confirmDismiss(),
        background: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
          color: Theme.of(context).colorScheme.error,
          child: Row(
            children: [
              Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.onError,
              ),
            ],
          ),
        ),
        child: Card(
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
        ),
      );
}
