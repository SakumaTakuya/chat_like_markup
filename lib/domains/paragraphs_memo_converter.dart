import 'memo.dart';
import 'paragraph.dart';

extension ParagraphsMemoConverter on Memo {
  void createTextFrom(List<Paragraph> paragraphs) {
    this.text = paragraphs.map((e) => e.content).join("\n\n");
  }

  List<Paragraph> splitIntoParagraphs() {
    final exp = RegExp(r'\n{2,}');
    return exp
            .allMatches(this.text)
            ?.map((match) => Paragraph(match.group(0)))
            ?.toList() ??
        [Paragraph(this.text)];
  }
}
