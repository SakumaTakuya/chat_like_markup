import '../domains/model.dart';
import '../domains/memo.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'memo_state.freezed.dart';

@freezed
abstract class MemosState with _$MemosState {
  const factory MemosState({
    @Default([]) List<Memo> memos,
  }) = MemosStateData;
  const factory MemosState.loading() = MemosStateLoading;
}

class MemosController extends StateNotifier<MemosState>
    with LocatorMixin
    implements ModelDeleter<Memo>, ModelSaver<Memo>, ModelSearcher<Memo> {
  MemosController(this._deleter, this._saver, this._searcher)
      : super(const MemosState.loading());
  final ModelDeleter<Memo> _deleter;
  final ModelSaver<Memo> _saver;
  final ModelSearcher<Memo> _searcher;

  final List<Memo> _pendingToSaves = [];
  final List<Memo> _pendingToDeletes = [];

  @protected
  @override
  get state {
    final current = super.state;

    if (current is MemosStateData) {
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
  void initState() {
    super.initState();

    // await Future<void>.delayed(const Duration(microseconds: 500));

    final memos = _searcher.searchAll()?.toList() ?? [];
    state = MemosState(memos: memos);
  }

  @override
  void delete(Memo model) {
    final currentState = state;
    _deleter.delete(model);

    if (currentState is MemosStateData) {
      final memos = currentState.memos.toList()..remove(model);
      state = currentState.copyWith(memos: memos);
      return;
    }

    _pendingToDeletes.add(model);
  }

  @override
  Future<void> save(Memo model) async {
    final currentState = state;
    _saver.save(model);

    if (currentState is MemosStateData) {
      final memos = currentState.memos.toList()..add(model);
      state = currentState.copyWith(memos: memos);
      return;
    }

    _pendingToSaves.add(model);
  }

  @override
  Memo search(int key) {
    final currentState = state;
    if (currentState is MemosStateData) {
      return _searcher.search(key);
    }

    return null;
  }

  @override
  Iterable<Memo> searchAll({query}) {
    final currentState = state;
    if (currentState is MemosStateData) {
      return _searcher.searchAll(query: query)?.toList() ?? [];
    }
    return [];
  }
}
