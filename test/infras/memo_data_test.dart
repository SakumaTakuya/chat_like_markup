import 'package:chat_like_markup/infras/memo_data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  final database = MemoDatabaseInHive();
  await Hive.initFlutter();
  Hive.registerAdapter(MemoInHiveAdapter());
  await database.open();
  setUp(() async {
    await database.box.deleteFromDisk();
    await database.open();
  });

  group('test MemoInHive', () {
    test('copy every data but key', () {
      final from = MemoInHive()
        ..key = 1
        ..title = 'test'
        ..text = 'test';
      final to = from.copy();

      expect(to.title, from.title);
      expect(to.text, from.text);
      expect(to, isNot(equals(from)));
      expect(to.key, isNot(equals(from.key)));
    });
  });

  group('test MemoDatabaseInHive', () {
    test('data has key only after saving', () {
      final data = MemoInHive()
        ..title = 'test'
        ..text = 'test';

      expect(data.key, null);
      expect(
        database.save(data),
        completion(predicate((_) => data.key == 0)),
      );
    });

    test('data is set datetime when saving', () {
      final fromDate = DateTime.fromMicrosecondsSinceEpoch(10);
      final data = MemoInHive()
        ..dateTime = fromDate
        ..title = 'test'
        ..text = 'test';

      expect(data.dateTime, fromDate);
      expect(
        database.save(data),
        completion(predicate((_) => data.dateTime != fromDate)),
      );
    });

    test('search data corresponding to the key', () {
      final future = Future(() async {
        for (var i = 0; i < 3; i++) {
          await database.save(MemoInHive()
            ..title = 'title$i'
            ..text = 'text$i');
        }
        return database.search(1);
      });

      expect(
        future,
        completion(predicate((data) =>
            data.key == 1 && data.title == 'title1' && data.text == 'text1')),
      );
    });

    test('search all data if arguments is null', () {
      final datas = List.generate(
          5,
          (i) => MemoInHive()
            ..title = 'title$i'
            ..text = 'text$i');

      final future = Future(() async {
        for (var data in datas) {
          await database.save(data);
        }
        return database.searchAll();
      });

      expect(future, completion(unorderedEquals(datas)));
    });

    test('search data satisfied the condition', () {
      final datas = List.generate(
          5,
          (i) => MemoInHive()
            ..title = 'title$i'
            ..text = 'text$i');

      final future = Future(() async {
        for (var data in datas) {
          await database.save(data);
        }
        for (var data in datas) {
          await database.save(data);
        }
        return database.searchAll(query: (d) => d.key < 6);
      });

      expect(future, completion(unorderedEquals(datas)));
    });

    test('delete target data', () {
      final datas = List.generate(
          5,
          (i) => MemoInHive()
            ..title = 'title$i'
            ..text = 'text$i');

      final future = Future(() async {
        for (var data in datas) {
          await database.save(data);
        }

        database.delete(1);
        return database.search(1);
      });

      expect(future, completion(equals(null)));
    });
  });
}
