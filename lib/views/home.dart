import 'package:chat_like_markup/domains/memo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../domains/model.dart';
import '../applications/memo_state.dart';
import 'widgets/memo_card.dart';

class Home<M extends Memo> extends StatefulWidget {
  Home(this._creater);
  final ModelCreater<M> _creater;

  @override
  _HomeState createState() => _HomeState<M>(_creater);
}

class _HomeState<M extends Memo> extends State<Home> {
  _HomeState(this._creater);
  final ModelCreater<M> _creater;
  final DateFormat dateKey = DateFormat.yMEd();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: _buildList(context),
        floatingActionButton: FloatingActionButton(
          onPressed: () async => _transitionToEdit(await _createCard(context)),
          child: Icon(Icons.add),
        ),
      );

  Widget _buildList(BuildContext context) =>
      context.watch<MemosState<M>>().when(
        (memos) {
          memos.sort((a, b) => a.dateTime.compareTo(b.dateTime));
          return ListView.builder(
            itemCount: memos.length,
            itemBuilder: (context, index) {
              final memo = memos[index];
              return MemoCard(
                memo,
                onTap: () => _transitionToEdit(memo),
                onDelete: () => _deleteCard(context, memo),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      );

  // void _transitionToEdit(MemoFacade memo) => Navigator.push(
  //       context,
  //       CupertinoPageRoute(
  //         builder: (context) => Edit(memo),
  //       ),
  //     );

  void _transitionToEdit(M memo) {}

  Future<M> _createCard(BuildContext context) async {
    final memo = _creater.create();
    await context.read<MemosController<M>>().save(memo);
    return memo;
  }

  void _deleteCard(BuildContext context, M memo) {
    context.read<MemosController<M>>().delete(memo);
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('deleted'),
      ),
    );
  }
}
