import 'package:hive/hive.dart';
import '../domains/memo.dart' show Memo;
import 'database.dart' show DatabaseInHive;

part 'memo_data.g.dart';

@HiveType(typeId: 1)
class MemoInHive implements Memo {
  @override
  @HiveField(0)
  int key;

  @override
  @HiveField(1)
  DateTime dateTime;

  @override
  @HiveField(2)
  String text;

  @override
  @HiveField(3)
  String title;

  @override
  MemoInHive copy() => MemoInHive()
    ..title = title
    ..text = text;
}

class MemoDatabaseInHive extends DatabaseInHive<MemoInHive> {
  MemoDatabaseInHive() : super('memo');
}
