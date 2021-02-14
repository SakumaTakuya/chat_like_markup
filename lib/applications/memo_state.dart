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

class MemosController extends StateNotifier<MemosState> with LocatorMixin {
  MemosController(this._deleter, this._saver, this._searcher)
      : super(const MemosState.loading());
  final ModelDeleter<Memo> _deleter;
  final ModelSaver<Memo> _saver;
  final ModelSearcher<Memo> _searcher;

  @protected
  final List<Memo> pendingToSaves = [];

  @protected
  final List<Memo> pendingToDeletes = [];

  @protected
  @override
  get state {
    final current = super.state;

    if (current is MemosStateData) {
      if (pendingToDeletes.isNotEmpty) {
        current.memos.removeWhere((memo) => pendingToDeletes.contains(memo));
        pendingToDeletes.clear();
      }

      if (pendingToSaves.isNotEmpty) {
        pendingToSaves.forEach((e) => _save(current.memos, e));
        pendingToSaves.clear();
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

  void delete(Memo model) {
    final currentState = state;
    _deleter.delete(model);

    if (currentState is MemosStateData) {
      final memos = currentState.memos.toList()..remove(model);
      state = currentState.copyWith(memos: memos);
      return;
    }

    pendingToDeletes.add(model);
  }

  Future<void> save(Memo model) async {
    final currentState = state;
    await _saver.save(model);

    if (currentState is MemosStateData) {
      final memos = currentState.memos.toList();
      _save(memos, model);

      state = currentState.copyWith(memos: memos);
      return;
    }

    pendingToSaves.add(model);
  }

  void _save(List<Memo> memos, Memo model) {
    final currentId = memos.indexWhere((e) => e.key == model.key);
    if (currentId == -1) {
      memos.add(model);
    } else {
      memos[currentId] = model;
    }
  }

  Iterable<Memo> searchAll({query}) {
    final currentState = state;
    if (currentState is MemosStateData) {
      return _searcher.searchAll(query: query)?.toList() ?? [];
    }
    return [];
  }
}
