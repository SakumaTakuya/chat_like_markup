import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domains/memo.dart';

import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

typedef void MemoCardFunc();

class MemoCard extends StatelessWidget {
  MemoCard(this._memo, {this.onTap, this.onDelete});
  final MemoCardFunc onTap;
  final MemoCardFunc onDelete;
  final Memo _memo;
  // final DateFormat _formater = DateFormat.yMMMMd();

  @override
  Widget build(BuildContext context) => Card(
        child: Dismissible(
          key: Key(_memo.key.toString()),
          direction: DismissDirection.startToEnd,
          onDismissed: (direction) => onDelete(),
          background: Container(color: Theme.of(context).errorColor),
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
