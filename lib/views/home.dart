import 'package:chat_like_markup/domains/memo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../applications/memo_state.dart';
import '../domains/model.dart';
import '../domains/memo.dart';
import 'widgets/memo_card.dart';

class Home extends StatefulWidget {
  Home(this._creater);
  final ModelCreater<Memo> _creater;

  @override
  _HomeState createState() => _HomeState(_creater);
}

class _HomeState extends State<Home> {
  _HomeState(this._creater);
  final ModelCreater<Memo> _creater;
  final DateFormat _format = DateFormat.yMEd();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: _buildList(context),
        floatingActionButton: FloatingActionButton(
          onPressed: () async => _transitionToEdit(await _createCard(context)),
          child: Icon(Icons.add),
        ),
      );

  Widget _buildList(BuildContext context) => context.watch<MemosState>().when(
        (memos) {
          memos.sort((a, b) => a.dateTime.compareTo(b.dateTime));
          return ListView.builder(
            itemCount: memos.length,
            itemBuilder: (context, index) {
              final memo = memos[index];

              if (index > 0 && memo.isPostedSameDay(memos[index - 1])) {
                return MemoCard(
                  memo,
                  onTap: () => _transitionToEdit(memo),
                  onDelete: () => _deleteCard(context, memo),
                );
              }

              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(
                        Theme.of(context).textTheme.bodyText2.fontSize / 2),
                    child: Text(
                      _format.format(memo.dateTime),
                      textAlign: TextAlign.center,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: const Border(
                        bottom: BorderSide(width: 1.0, color: Colors.grey),
                      ),
                    ),
                  ),
                  MemoCard(
                    memo,
                    onTap: () => _transitionToEdit(memo),
                    onDelete: () => _deleteCard(context, memo),
                  ),
                ],
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

  void _transitionToEdit(Memo memo) {}

  Future<Memo> _createCard(BuildContext context) async {
    final memo = _creater.create();
    await context.read<ModelSaver<Memo>>().save(memo);
    return memo;
  }

  void _deleteCard(BuildContext context, Memo memo) {
    context.read<ModelDeleter<Memo>>().delete(memo);
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('deleted'),
      ),
    );
  }
}
