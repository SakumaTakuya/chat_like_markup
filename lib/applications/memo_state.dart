import '../domains/memo.dart';
import '../domains/paragraphs_memo_converter.dart';
import '../domains/paragraph.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'memo_state.freezed.dart';

@freezed
abstract class MemoState with _$MemoState {
  const factory MemoState({
    Memo memo,
  }) = MemoStateData;
  const factory MemoState.loading() = MemoStateLoading;
}

class MemoController extends StateNotifier<MemoState> with LocatorMixin {
  MemoController(Memo memo) : super(MemoState(memo: memo));

  void updateMemo(String title, List<Paragraph> paragraphs) {
    final currentState = state;
    if (currentState is MemoStateData) {
      final memo = currentState.memo
        ..title = title
        ..createTextFrom(paragraphs);
      state = currentState.copyWith(memo: memo);
    }
  }
}
