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
  String toString() {
    return '$key [$title] $text ($dateTime)';
  }
}

class MemoDatabaseInHive extends DatabaseInHive<Memo> {
  MemoDatabaseInHive() : super('memo');

  @override
  Future<void> save(Memo model) async {
    final forSaving = MemoInHive()
      ..key = model.key
      ..dateTime = DateTime.now()
      ..title = model.title
      ..text = model.text;
    await super.save(forSaving);

    model
      ..key = forSaving.key
      ..dateTime = forSaving.dateTime;

    print("saved");
  }

  @override
  Memo create() => MemoInHive()
    ..dateTime = DateTime.now()
    ..title = ''
    ..text = '';
}
