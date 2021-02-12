import 'package:chat_like_markup/domains/memo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../domains/model.dart';
import 'widgets/memo_card.dart';

class Home extends StatefulWidget {
  Home(this._creater, this._deleter, this._searcher, this._saver);
  final ModelCreater<Memo> _creater;
  final ModelDeleter<Memo> _deleter;
  final ModelSearcher<Memo> _searcher;
  final ModelSaver<Memo> _saver;

  @override
  _HomeState createState() => _HomeState(
        _creater,
        _deleter,
        _saver,
        _searcher.searchAll()?.toList() ?? [],
      );
}

class _HomeState extends State<Home> {
  _HomeState(this._creater, this._deleter, this._saver, this._memos)
      : assert(_memos != null);
  final ModelCreater<Memo> _creater;
  final ModelDeleter<Memo> _deleter;
  final ModelSaver<Memo> _saver;
  final List<Memo> _memos;
  final DateFormat dateKey = DateFormat.yMEd();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final memo = _memos[index];
            return MemoCard(
              memo,
              onTap: () => _transitionToEdit(memo),
              onDelete: () {
                _deleteCard(memo);
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text('deleted'),
                  ),
                );
              },
            );
          },
          itemCount: _memos.length,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _transitionToEdit(_createCard()),
          child: Icon(Icons.add),
        ),
      );

  // void _transitionToEdit(MemoFacade memo) => Navigator.push(
  //       context,
  //       CupertinoPageRoute(
  //         builder: (context) => Edit(memo),
  //       ),
  //     );

  void _transitionToEdit(Memo memo) {}

  void _deleteCard(Memo memo) {
    setState(() => _memos.remove(memo));
    _deleter.delete(memo.key);
  }

  Memo _createCard() {
    final memo = _creater.create();
    setState(() => _memos.insert(0, memo));
    _saver.save(memo);
    return memo;
  }
}
