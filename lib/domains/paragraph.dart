class Paragraph {
  const Paragraph(this._content);
  final String _content;

  bool get isEnd => _content.endsWith('\n\n');
  String get content => _content.splitMapJoin(
        RegExp(r'\n{2,}'),
        onMatch: (m) => '\n',
        onNonMatch: (n) => n,
      );
}
