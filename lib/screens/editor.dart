import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../domains/list_with_head.dart';
import '../domains/paragraph.dart';
import '../widgets/paragraph_list.dart';
import '../widgets/edit_field.dart';

class EditScreen extends StatefulWidget {
  EditScreen(
    this.creater,
    this.headoperator,
    this.sentence,
  );
  final ParagraphCreater creater;
  final HeadOperator<Paragraph> headoperator;
  final ListWithHead<Paragraph> sentence;

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _controller;

  @override
  void didUpdateWidget(covariant EditScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _controller = TextEditingController(text: widget.sentence.current.content);
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: ParagraphList(
              widget.sentence,
              onSelect: (index) {
                widget.headoperator.seek(index);
              },
              onInsert: (index) {
                widget.headoperator.seek(index + 1);

                widget.headoperator.insert(widget.creater.create().first);
              },
              onReorder: (oldIndex, newIndex) {
                if (newIndex > oldIndex) {
                  newIndex -= 1;
                }

                widget.headoperator.seek(newIndex);
                widget.headoperator.bring(oldIndex);
              },
            ),
          ),
          EditField(
            controller: _controller,
            onSave: (text) {
              widget.creater.create(text).forEach(
                  (paragraph) => widget.headoperator.rewrite(paragraph));
              widget.headoperator.seekNextOrNew(
                newItem: widget.creater.create().first,
              );
            },
            onEdit: () {
              //TODO: implement scroll
              // ParagraphList.animateTo( widget.paragraphList.head);
            },
          ),
        ],
      );

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
