import 'memo.dart';

extension MemoDateComparator on Memo {
  bool isPostedSameDay(Memo other) {
    return this.dateTime.difference(other.dateTime).inDays == 0;
  }
}
