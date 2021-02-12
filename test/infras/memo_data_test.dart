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

  group('test MemoDatabaseInHive', () {
    test('key is null when creating', () {
      final data = database.create();

      expect(data.key, null);
    });

    test('datetime is not null when creating', () {
      final data = database.create();

      expect(data.dateTime, isNot(equals(null)));
    });

    test('title is not null when creating', () {
      final data = database.create();

      expect(data.title, isNot(equals(null)));
    });

    test('text is not null when creating', () {
      final data = database.create();

      expect(data.text, isNot(equals(null)));
    });

    test('data has key only after saving', () {
      final data = database.create();

      expect(data.key, null);
      expect(
        database.save(data),
        completion(predicate((_) => data.key == 0)),
      );
    });

    test('data is set datetime when saving', () {
      final fromDate = DateTime.fromMicrosecondsSinceEpoch(10);
      final data = database.create()..dateTime = fromDate;

      expect(data.dateTime, fromDate);
      expect(
        database.save(data),
        completion(predicate((_) => data.dateTime != fromDate)),
      );
    });

    test('search data corresponding to the key', () {
      final future = Future(() async {
        for (var i = 0; i < 3; i++) {
          await database.save(database.create()
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
          (i) => database.create()
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
          (i) => database.create()
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
          (i) => database.create()
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

    test('there are no errors if data is null', () {
      database.delete(null);
    });
  });
}
