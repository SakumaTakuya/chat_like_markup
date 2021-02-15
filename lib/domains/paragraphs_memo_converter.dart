import 'memo.dart';

extension ParagraphsMemoConverter on Memo {
  void createTextFrom(List<String> paragraphs) {
    this.text = paragraphs.join("\n\n");
  }

  List<String> splitIntoParagraphs() {
    final exp = RegExp(r'\n{2,}');
    return exp
            .allMatches(this.text)
            ?.map((match) => match.group(0))
            ?.toList() ??
        [this.text];
  }
}
