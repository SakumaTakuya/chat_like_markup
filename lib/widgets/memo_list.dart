import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import '../domains/memo.dart';
import '../domains/date_comparator.dart';
import 'memo_card.dart';
import 'label_card.dart';

typedef void MemoListCallback(Memo memo);

class MemoList extends StatelessWidget {
  MemoList(this.memos, {this.onSelect, this.onDelete});
  final List<Memo> memos;
  final MemoListCallback onSelect;
  final MemoListCallback onDelete;
  final DateFormat _format = DateFormat.yMEd();

  @override
  Widget build(BuildContext context) {
    memos.sort((a, b) => a.dateTime.compareTo(b.dateTime));
    return ListView.builder(
        itemCount: memos.length,
        itemBuilder: (contet, index) {
          final memo = memos[index];

          if (index > 0 && memo.isPostedSameDay(memos[index - 1])) {
            return buildCard(context, memo);
          }

          return Column(
            children: [
              LabelCard(_format.format(memo.dateTime ?? DateTime.now())),
              buildCard(context, memo),
            ],
          );
        });
  }

  @protected
  Widget buildCard(context, Memo memo) => MemoCard(
        memo,
        onTap: () => onSelect(memo),
        onDelete: () => onDelete(memo),
      );
}
