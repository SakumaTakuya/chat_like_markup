import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../states/memo_list.dart';
import '../domains/model.dart';
import '../domains/memo.dart';
import '../infras/widgets/provider.dart';
import '../widgets/memo_list.dart';

class HomeView extends StatelessWidget {
  HomeView(this._creater);
  final ModelCreater<Memo> _creater;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context).home)),
        body: Watcher<MemoListState>(
          childbuilder: (_, data) => data.maybeWhen(
            (memos) => MemoList(
              memos,
              onSelect: (memo) async => await _transitionToEdit(context, memo),
              onDelete: (memo) => _deleteCard(context, memo),
            ),
            orElse: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
        floatingActionButton: Watcher<MemoListState>(
          childbuilder: (context, data) => data.maybeWhen(
            (_) => FloatingActionButton(
              onPressed: () async => await _transitionToEdit(
                context,
                await _createCard(context),
              ),
              child: Icon(Icons.add),
            ),
            orElse: null,
          ),
        ),
      );

  Future<void> _transitionToEdit(BuildContext context, Memo memo) async {
    await Navigator.pushNamed(context, '/edit', arguments: memo);
  }

  Future<Memo> _createCard(BuildContext context) async {
    final memo = _creater.create();
    await Reader.of<MemoListController>(context).save(memo);
    return memo;
  }

  void _deleteCard(BuildContext context, Memo memo) {
    Reader.of<MemoListController>(context).delete(memo);
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(AppLocalizations.of(context).delete),
      ),
    );
  }
}
