import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../domains/model.dart';
import '../domains/memo.dart';
import '../domains/paragraph.dart';
import '../domains/list_with_head.dart';
import 'package:state_notifier/state_notifier.dart';

part 'editing_memo.freezed.dart';

@freezed
abstract class EditingMemoState with _$EditingMemoState {
  const factory EditingMemoState({
    int key,
    String title,
    ListWithHead<Paragraph> sentence,
  }) = EditingMemoStateData;
  const factory EditingMemoState.loading() = EditingMemoStateLoading;
}

class EditingMemoController extends StateNotifier<EditingMemoState>
    with LocatorMixin
    implements HeadOperator<Paragraph> {
  EditingMemoController() : super(const EditingMemoState.loading());

  Future<void> initializeWith(Memo memo, ParagraphCreater creater) async {
    state = EditingMemoState(
      key: memo.key,
      title: memo.title,
      sentence: ListWithHead(creater.create(memo.text), 0),
    );
    debugPrint('initialize editing memo state with $memo');
  }

  void updateTitle(String title) {
    final currentState = state;
    if (currentState is EditingMemoStateData) {
      state = currentState.copyWith(title: title);
      debugPrint('update title ($title)');
    }
  }

  Memo buildMemo(ModelCreater<Memo> creater) {
    final memo = creater.create();
    final currentState = state;
    if (currentState is EditingMemoStateData) {
      memo
        ..key = currentState.key
        ..title = currentState.title
        ..text = currentState.sentence.content.makeSentence();
      debugPrint('build $memo');
    }
    return memo;
  }

  @override
  void bring(int fromIndex) {
    final currentState = state;
    if (currentState is EditingMemoStateData) {
      final sentence = currentState.sentence.content.toList();
      final head = currentState.sentence.head;
      final item = sentence.removeAt(fromIndex);

      sentence.insert(head, item);
      state = currentState.copyWith(sentence: ListWithHead(sentence, head));
      debugPrint('bring $item from $fromIndex to $head');
    }
  }

  @override
  void insert(Paragraph value) {
    final currentState = state;
    if (currentState is EditingMemoStateData) {
      final head = currentState.sentence.head;
      final sentence = currentState.sentence.content.toList()
        ..insert(head, value);

      state = currentState.copyWith(sentence: ListWithHead(sentence, head));
      debugPrint('rewrite item at $head');
    }
  }

  @override
  void rewrite(Paragraph value) {
    final currentState = state;
    if (currentState is EditingMemoStateData) {
      final head = currentState.sentence.head;
      final sentence = currentState.sentence.content.toList()..[head] = value;

      state = currentState.copyWith(sentence: ListWithHead(sentence, head));
      debugPrint('rewrite item at $head');
    }
  }

  @override
  void seek(int head) {
    final currentState = state;
    if (currentState is EditingMemoStateData) {
      final sentence = currentState.sentence.content.toList();
      state = currentState.copyWith(sentence: ListWithHead(sentence, head));
      debugPrint('seek to $head (length ${sentence.length})');
    }
  }

  @override
  void seekNextOrNew({Paragraph newItem}) {
    final currentState = state;
    if (currentState is EditingMemoStateData) {
      final head = currentState.sentence.head + 1;
      final sentence = currentState.sentence.content.toList();

      if (head >= sentence.length && newItem != null) {
        sentence.add(newItem);
        debugPrint('insert new item $newItem');
      } else {
        debugPrint('seek to $head (length ${sentence.length})');
      }

      state = currentState.copyWith(sentence: ListWithHead(sentence, head));
    }
  }
}
