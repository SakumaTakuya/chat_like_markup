import '../domains/model.dart';
import '../domains/memo.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'memo_state.freezed.dart';

@freezed
abstract class MemosState<M extends Memo> with _$MemosState {
  const factory MemosState({
    @Default([]) List<M> memos,
  }) = MemosStateData<M>;
  const factory MemosState.loading() = MemosStateLoading;
}

class MemosController<M extends Memo> extends StateNotifier<MemosState<M>>
    with LocatorMixin
    implements ModelDeleter<M>, ModelSaver<M>, ModelSearcher<M> {
  MemosController(this._deleter, this._saver, this._searcher)
      : super(const MemosState.loading());
  final ModelDeleter<M> _deleter;
  final ModelSaver<M> _saver;
  final ModelSearcher<M> _searcher;

  final List<M> _pendingToSaves = [];
  final List<M> _pendingToDeletes = [];

  @protected
  @override
  get state {
    final current = super.state;

    if (current is MemosStateData<M>) {
      if (_pendingToDeletes.isNotEmpty) {
        current.memos.removeWhere((memo) => _pendingToDeletes.contains(memo));
        _pendingToDeletes.clear();
      }

      if (_pendingToSaves.isNotEmpty) {
        current.memos.addAll(_pendingToSaves);
        _pendingToSaves.clear();
      }
    }

    return current;
  }

  @override
  void initState() async {
    super.initState();

    await Future<void>.delayed(const Duration(microseconds: 500));

    final memos = searchAll();
    state = MemosState<M>(memos: memos);
  }

  @override
  void delete(M model) {
    final currentState = (state as MemosStateData<M>);
    if (currentState == null) {
      _pendingToDeletes.add(model);
    }
    _deleter.delete(model);

    final memos = currentState.memos.toList()..remove(model);
    state = currentState.copyWith(memos: memos);
  }

  @override
  Future<void> save(M model) async {
    final currentState = (state as MemosStateData<M>);
    if (currentState == null) {
      _pendingToSaves.add(model);
    }
    _saver.save(model);

    final memos = currentState.memos.toList()..add(model);
    state = currentState.copyWith(memos: memos);
  }

  @override
  M search(int key) {
    final currentState = (state as MemosStateData<M>);
    if (currentState == null) {
      return null;
    }

    return _searcher.search(key);
  }

  @override
  Iterable<M> searchAll({query}) {
    final currentState = (state as MemosStateData<M>);
    if (currentState == null) {
      return [];
    }

    return _searcher.searchAll(query: query)?.toList() ?? [];
  }
}
