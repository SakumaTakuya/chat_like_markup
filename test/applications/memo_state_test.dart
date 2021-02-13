import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import '../../lib/applications/memo_state.dart';
import '../../lib/domains/memo.dart';
import '../../lib/domains/model.dart';

class MemoImpl extends Memo {}

class MemoOperatorImpl
    implements ModelDeleter<Memo>, ModelSaver<Memo>, ModelSearcher<Memo> {
  @override
  void delete(Memo model) => print('delete');

  @override
  Future<void> save(Memo model) async => print('save');

  @override
  Memo search(int key) {
    throw UnimplementedError();
  }

  @override
  Iterable<Memo> searchAll({query}) {
    print('search');
    return [MemoImpl()];
  }
}

Future<void> main() async {
  MemosController controller;
  setUp(() {
    final impl = MemoOperatorImpl();
    controller = MemosController(impl, impl, impl);
  });
  group('MemosState tests', () {
    test('can add element', () {
      final state = MemosState(memos: []);
      if (state is MemosStateData) {
        expect(state.memos.length, 0);
        state.memos.add(MemoImpl());
        expect(state.memos.length, 1);
      }
    });
  });

  group('MemosController tests', () {
    test('pend save with loading state', () async {
      await controller.save(MemoImpl());
      expect(controller.pendingToSaves.length, 1);
    });

    test('add data pending save when state is enabled', () async {
      await controller.save(MemoImpl());
      controller.state = MemosState(memos: []);

      final state = controller.state;
      if (state is MemosStateData) {
        expect(state.memos.length, 1);
        expect(controller.pendingToSaves.length, 0);
      }
    });

    test('pend delete with loading state', () {
      final memo = MemoImpl();
      controller.delete(memo);
      expect(controller.pendingToDeletes.length, 1);
    });

    test('remove data pending delete when state is enabled', () {
      final memo = MemoImpl();
      controller.delete(memo);
      controller.state = MemosState(memos: [memo]);

      final state = controller.state;
      if (state is MemosStateData) {
        expect(state.memos.length, 0);
        expect(controller.pendingToDeletes.length, 0);
      }
    });

    test('can not search with loading state', () {
      final searched = controller.searchAll();
      expect(searched.length, 0);
    });

    test('can search all data with enabled state', () {
      controller.state = MemosState(memos: []);
      final searched = controller.searchAll();
      expect(searched.length, 1);
    });
  });
}
