import '../domains/memo.dart' show Memo;
import '../domains/model.dart' show ModelSaver, ModelSearcher, QueryFunction;

class MemoFacade<M extends Memo> {
  MemoFacade(this._saver, M memo) : _memo = memo;

  final ModelSaver<M> _saver;
  M _memo;

  set dateTime(DateTime value) => _memo.dateTime = value;
  set title(String value) => _memo.title = value;
  set text(String value) => _memo.text = value;

  Future<void> save() async {
    await _saver.save(_memo);
  }
}

class MemoFacadeFactory<M extends Memo> {
  const MemoFacadeFactory(this._searcher, this._saver, this._template);
  final ModelSearcher<M> _searcher;
  final ModelSaver<M> _saver;
  final M _template;

  MemoFacade<M> searchOrCreate(int key) {
    final memo = _searcher.search(key);
    if (memo != null) {
      return MemoFacade<M>(_saver, memo);
    }

    final copied = _template.copy() as M;
    if (copied != null) {
      return MemoFacade<M>(_saver, copied);
    }
    throw 'Templete type is not matched';
  }

  Iterable<MemoFacade<M>> searchAll({QueryFunction<M> query}) => _searcher
      .searchAll(query: query)
      .map((memo) => MemoFacade<M>(_saver, memo));
}
