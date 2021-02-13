import 'package:flutter_test/flutter_test.dart';
import '../../lib/domains/memo.dart';

class MemoImpl extends Memo {}

void main() {
  group('test MemoDateCompare', () {
    test('post same day', () {
      final a = MemoImpl()..dateTime = DateTime(2000, 1, 1);
      final b = MemoImpl()..dateTime = DateTime(2000, 1, 1);

      expect(a.isPostedSameDay(b), true);
    });

    test('post the next day', () {
      final a = MemoImpl()..dateTime = DateTime(2000, 1, 1);
      final b = MemoImpl()..dateTime = DateTime(2000, 1, 2);

      expect(a.isPostedSameDay(b), false);
    });

    test('post the previous day', () {
      final a = MemoImpl()..dateTime = DateTime(2000, 1, 2);
      final b = MemoImpl()..dateTime = DateTime(2000, 1, 1);

      expect(a.isPostedSameDay(b), false);
    });
  });
}
