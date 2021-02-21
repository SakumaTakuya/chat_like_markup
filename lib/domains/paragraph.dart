import 'package:flutter/cupertino.dart';

abstract class Paragraph {
  @protected
  String get raw;
  String get separator;
  String get content;
}

abstract class ParagraphCreater<P extends Paragraph> {
  List<P> create([String text]);
}

extension SentenceMaker<P extends Paragraph> on List<P> {
  String makeSentence() => fold(
        '',
        (prev, para) => '$prev${para.content}${para.separator}',
      );
}
