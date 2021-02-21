import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../domains/memo.dart';
import 'generals/decoration.dart';

typedef void MemoCardFunc();

class MemoCard extends StatelessWidget {
  MemoCard(this._memo, {this.onTap, this.onDelete});
  final MemoCardFunc onTap;
  final MemoCardFunc onDelete;
  final Memo _memo;
  // final DateFormat _formater = DateFormat.yMMMMd();

  @override
  Widget build(BuildContext context) => Dismissible(
        key: Key(_memo.key.toString()),
        direction: DismissDirection.startToEnd,
        onDismissed: (direction) => onDelete(),
        background: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
          color: Theme.of(context).colorScheme.error,
          child: Row(
            children: [
              Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.onError,
              ),
            ],
          ),
        ),
        child: Container(
          decoration: BorderDecoration(
            context,
            color: Theme.of(context).cardColor,
          ),
          child: ListTile(
            onTap: onTap,
            title: Text(
              _memo.title == ''
                  ? AppLocalizations.of(context).newMemo
                  : _memo.title,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              _memo.text,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.copy),
              onPressed: _copyToClipboard,
            ),
          ),
        ),
      );

  void _copyToClipboard() {}
}
