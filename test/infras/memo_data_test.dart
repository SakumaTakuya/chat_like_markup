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

    test('data has key only after saving', () async {
      final data = database.create();

      expect(data.key, null);
      await database.save(data);
      expect(data.key, 0);
    });

    test('data is set datetime when saving', () async {
      final fromDate = DateTime.fromMicrosecondsSinceEpoch(10);
      final data = database.create()..dateTime = fromDate;

      expect(data.dateTime, fromDate);
      await database.save(data);
      expect(data.dateTime, isNot(equals(fromDate)));
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

    test('search all data if arguments is null', () async {
      final datas = List.generate(
          5,
          (i) => database.create()
            ..title = 'title$i'
            ..text = 'text$i');

      for (var data in datas) {
        await database.save(data);
      }

      expect(
        database.searchAll().map((e) => e.key),
        unorderedEquals(datas.map((e) => e.key)),
      );
    });

    test('search data satisfied the condition', () async {
      final datas = List.generate(
          5,
          (i) => database.create()
            ..title = 'title$i'
            ..text = 'text$i');

      for (var data in datas) {
        await database.save(data);
      }

      final searched = database.searchAll(query: (d) => d.key < 2);
      expect(
        searched.map((e) => e.key).toList(),
        unorderedEquals([0, 1]),
      );
    });

    test('delete target data', () async {
      final datas = List.generate(
          5,
          (i) => database.create()
            ..title = 'title$i'
            ..text = 'text$i');

      for (var data in datas) {
        await database.save(data);
      }

      database.delete(datas[0]);
      final searched = database.search(0);

      expect(searched, null);
    });

    test('there are no errors if data is null', () {
      database.delete(null);
    });
  });
}
