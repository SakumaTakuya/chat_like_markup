import 'paragraph.dart';

class MarkdownParagraph implements Paragraph {
  const MarkdownParagraph([this.raw = '']);
  @override
  final String raw;

  @override
  String get separator => '\n\n';

  @override
  String get content => raw.splitMapJoin(
        RegExp(r'\n{2,}'),
        onMatch: (m) => '\n',
        onNonMatch: (n) => n,
      );
}

class MarkdownParagraphCreater implements ParagraphCreater<MarkdownParagraph> {
  final String separator = MarkdownParagraph().separator;

  @override
  List<MarkdownParagraph> create([String text]) {
    if (text == null) {
      return [MarkdownParagraph()];
    }
    return text.split(separator).map((e) => MarkdownParagraph(e)).toList();
  }
}
