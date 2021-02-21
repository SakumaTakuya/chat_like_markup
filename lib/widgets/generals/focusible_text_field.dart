import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef void FocusibleTextFieldCallback();

class FocusibleTextField extends StatefulWidget {
  FocusibleTextField({
    this.onFocus,
    this.onUnfocus,
    this.controller,
    this.autofocus = false,
    this.maxLines,
    this.keyboardType = TextInputType.multiline,
  });
  final FocusibleTextFieldCallback onFocus;
  final FocusibleTextFieldCallback onUnfocus;
  final TextEditingController controller;
  final bool autofocus;
  final int maxLines;
  final TextInputType keyboardType;

  @override
  _FocusibleTextFieldState createState() => _FocusibleTextFieldState();
}

class _FocusibleTextFieldState extends State<FocusibleTextField> {
  FocusNode _focusNode;

  void requestFocus() => FocusScope.of(context).requestFocus(_focusNode);

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()
      ..addListener(() {
        if (_focusNode.hasFocus) {
          widget.onFocus?.call();
        } else {
          widget.onUnfocus?.call();
        }
      });
  }

  // widget経由でアクセスしないとControllerが保持されてしまって変更することができない
  @override
  Widget build(BuildContext context) => TextField(
        autofocus: widget.autofocus,
        maxLines: widget.maxLines,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        focusNode: _focusNode,
      );

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}
