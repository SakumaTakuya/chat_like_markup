import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef void ChangeCallback(String text);

class TitleEditor extends StatefulWidget {
  TitleEditor(this.text, {@required this.onChange}) : assert(onChange != null);
  final String text;
  final ChangeCallback onChange;

  @override
  _TitleEditorState createState() => _TitleEditorState();
}

class _TitleEditorState extends State<TitleEditor> {
  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget?.text);
  }

  @override
  void didUpdateWidget(covariant TitleEditor oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget != oldWidget) {
      _textEditingController.text =
          widget?.text ?? _textEditingController?.text ?? oldWidget?.text;
    }
  }

  @override
  Widget build(BuildContext context) => TextField(
        autofocus: false,
        maxLines: 1,
        onChanged: widget.onChange,
        controller: _textEditingController,
      );

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }
}
