import 'memo.dart';
import 'paragraph.dart';

// extension ParagraphsMemoConverter on Memo {
//   void createTextFrom(List<Paragraph> paragraphs) {
//     this.text = paragraphs.map((e) => e?.content ?? '').join("\n\n");
//   }

//   List<Paragraph> splitIntoParagraphs() {
//     final exp = RegExp(r'\n{2,}');
//     final matches = exp
//         .allMatches(this.text)
//         ?.map((match) => Paragraph(match.group(0)))
//         ?.toList();

//     if (matches.length == 0) {
//       return [Paragraph(this.text)];
//     }

//     return matches;
//   }
// }

extension SentenceMaker<P extends Paragraph> on List<P> {
  String makeSentence() => fold(
        '',
        (prev, para) => '$prev${para.content}${para.separator}',
      );
}
