import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        child: ListTile(
          onTap: onTap,
          // leading: Text(_formater.format(DateTime.now())),
          title: Text(
            _memo.title,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            _memo.text ?? '',
            overflow: TextOverflow.ellipsis,
          ),
          trailing: PopupMenuButton<MemoCardFunc>(
            itemBuilder: buildItem,
            onSelected: (value) => value(),
          ),
        ),
      );

  List<PopupMenuEntry<MemoCardFunc>> buildItem(BuildContext context) => [
        PopupMenuItem<MemoCardFunc>(
          child: Row(children: [
            const Icon(Icons.copy),
            Text(AppLocalizations.of(context).copyFullText),
          ]),
          value: _copyToClipboard,
        ),
        PopupMenuItem(
            child: Row(
              children: [
                Icon(
                  Icons.delete,
                  color: Theme.of(context).errorColor,
                ),
                Text(
                  AppLocalizations.of(context).delete,
                  style: TextStyle(
                    color: Theme.of(context).errorColor,
                  ),
                ),
              ],
            ),
            value: onDelete),
      ];

  void _copyToClipboard() {}
}
