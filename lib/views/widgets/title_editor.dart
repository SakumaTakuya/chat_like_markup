import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleEditor extends StatelessWidget {
  TitleEditor({String title})
      : _textEditingController = TextEditingController(text: title);
  final TextEditingController _textEditingController;

  String get title => _textEditingController.text;

  @override
  Widget build(BuildContext context) => TextField(
        autofocus: false,
        maxLines: 1,
        controller: _textEditingController,
      );
}
