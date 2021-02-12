import 'package:chat_like_markup/infras/memo_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../lib/applications/memo_state.dart';
import '../../lib/domains/memo.dart';

class MemoImpl extends Memo {}

Future<void> main() async {
  group('MemosState tests', () {
    test('can add element', () {
      final state = MemosState<MemoImpl>(memos: []);
      if (state is MemosStateData<MemoImpl>) {
        expect(state.memos.length, 0);
        state.memos.add(MemoImpl());
        expect(state.memos.length, 1);
      }
    });
  });
}
