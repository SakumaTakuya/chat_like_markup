import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreviewScreen extends StatelessWidget {
  PreviewScreen({@required this.text});
  final String text;

  @override
  Widget build(BuildContext context) => Text(text);
}
