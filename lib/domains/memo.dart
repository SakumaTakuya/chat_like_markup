import 'model.dart' show Model;

abstract class Memo extends Model {
  DateTime dateTime;
  String title;
  String text;
}

extension MemoDateCompare on Memo {
  bool isPostedSameDay(Memo other) {
    return this.dateTime.difference(other.dateTime).inDays == 0;
  }
}
