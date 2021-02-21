import '../domains/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../domains/memo.dart';
import '../domains/paragraph.dart';
import '../domains/list_with_head.dart';
import '../domains/paragraphs_memo_converter.dart';
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
  }

  void updateTitle(String title) {
    final currentState = state;
    if (currentState is EditingMemoStateData) {
      currentState.copyWith(title: title);
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
    }
  }

  @override
  void rewrite(Paragraph value) {
    final currentState = state;
    if (currentState is EditingMemoStateData) {
      final head = currentState.sentence.head;
      final sentence = currentState.sentence.content.toList()..[head] = value;

      state = currentState.copyWith(sentence: ListWithHead(sentence, head));
    }
  }

  @override
  void seek(int head) {
    final currentState = state;
    if (currentState is EditingMemoStateData) {
      final head = currentState.sentence.head;
      final sentence = currentState.sentence.content.toList();
      state = currentState.copyWith(sentence: ListWithHead(sentence, head));
    }
  }

  @override
  void seekNextOrNew({Paragraph newItem}) {
    final currentState = state;
    if (currentState is EditingMemoStateData) {
      final head = currentState.sentence.head;
      final sentence = currentState.sentence.content.toList();

      if (head >= sentence.length && newItem != null) {
        sentence.add(newItem);
      }

      state = currentState.copyWith(sentence: ListWithHead(sentence, head + 1));
    }
  }
}
