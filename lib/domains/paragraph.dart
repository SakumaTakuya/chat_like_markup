class Paragraph {
  const Paragraph(this._content);
  final String _content;

  String get separator => '';

  bool get isEnd => _content.endsWith(separator);
  String get content => _content.splitMapJoin(
        RegExp(r'\n{2,}'),
        onMatch: (m) => '\n',
        onNonMatch: (n) => n,
      );
}

class MarkdownParagraph implements Paragraph {
  const MarkdownParagraph(this._content);
  final String _content;

  @override
  String get separator => '\n\n';

  @override
  bool get isEnd => _content.endsWith(separator);

  @override
  String get content => _content.splitMapJoin(
        RegExp(r'\n{2,}'),
        onMatch: (m) => '\n',
        onNonMatch: (n) => n,
      );
}

abstract class ParagraphCreater<P extends Paragraph> {
  List<P> create([String text]);
}
