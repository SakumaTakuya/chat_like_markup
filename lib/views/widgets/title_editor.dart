import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../applications/memo_state.dart';

class TitleEditor extends StatelessWidget {
  TitleEditor() : _textEditingController = TextEditingController();
  final TextEditingController _textEditingController;

  String get title => _textEditingController.text;

  @override
  Widget build(BuildContext context) {
    _textEditingController.text = context.select<MemoState, String>(
      (state) => state.maybeWhen(
        (memo) => memo.title,
        orElse: () => _textEditingController.text,
      ),
    );

    return TextField(
      autofocus: false,
      maxLines: 1,
      controller: _textEditingController,
    );
  }
}
