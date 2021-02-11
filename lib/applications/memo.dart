import '../domains/memo.dart' show Memo;
import '../domains/model.dart'
    show ModelDeleter, ModelSaver, ModelSearcher, QueryFunction;

class MemoFacade<M extends Memo> {
  MemoFacade(this._saver, M memo) : _memo = memo;

  final ModelSaver<M> _saver;
  M _memo;

  get key => _memo.key;
  get dateTime => _memo.dateTime;
  get title => _memo.title;
  get text => _memo.text;

  set dateTime(DateTime value) => _memo.dateTime = value;
  set title(String value) => _memo.title = value;
  set text(String value) => _memo.text = value;

  Future<void> save() async {
    await _saver.save(_memo);
  }
}

class MemoFacadeProvider<M extends Memo> {
  const MemoFacadeProvider(
      this._searcher, this._saver, this._deleter, this._template);
  final ModelSearcher<M> _searcher;
  final ModelSaver<M> _saver;
  final ModelDeleter<M> _deleter;
  final M _template;

  void delete(MemoFacade<M> data) {
    if (data.key != null) {
      _deleter.delete(data.key);
    }
  }

  MemoFacade<M> searchOrCreate(int key) {
    final memo = _searcher.search(key);
    if (memo != null) {
      return MemoFacade<M>(_saver, memo);
    }

    return _create(key: key);
  }

  MemoFacade<M> create() => _create();

  MemoFacade<M> _create({int key}) {
    final copied = _template.copy() as M;
    if (copied != null) {
      copied.key = key;
      return MemoFacade<M>(_saver, copied);
    }
    throw 'Templete type is not matched';
  }

  Iterable<MemoFacade<M>> searchAll({QueryFunction<M> query}) => _searcher
      .searchAll(query: query)
      .map((memo) => MemoFacade<M>(_saver, memo));
}
