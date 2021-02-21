import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleEditor extends StatefulWidget {
  TitleEditor(this.text);
  final String text;

  @override
  _TitleEditorState createState() => _TitleEditorState();
}

class _TitleEditorState extends State<TitleEditor> {
  TextEditingController _textEditingController;

  @override
  void didUpdateWidget(covariant TitleEditor oldWidget) {
    super.didUpdateWidget(oldWidget);
    _textEditingController = TextEditingController(
        text: widget?.text ?? _textEditingController?.text ?? oldWidget?.text);
  }

  @override
  Widget build(BuildContext context) => TextField(
        autofocus: false,
        maxLines: 1,
        controller: _textEditingController,
      );
}
