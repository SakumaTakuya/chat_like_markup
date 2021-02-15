import '../domains/memo.dart';
import '../domains/paragraphs_memo_converter.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'paragraph_list_state.freezed.dart';

@freezed
abstract class ParagraphListState with _$ParagraphListState {
  const factory ParagraphListState({
    @Default([]) List<String> paragraphs,
  }) = ParagraphListStateData;
  const factory ParagraphListState.loading() = ParagraphListStateLoading;
}

class ParagraphsController extends StateNotifier<ParagraphListState>
    with LocatorMixin {
  ParagraphsController() : super(const ParagraphListState.loading());

  @override
  Future<void> initState() async {
    super.initState();
  }

  Future<void> buildParagraphs(Memo memo) async {
    final paragraphs = memo.splitIntoParagraphs();
    state = ParagraphListState(paragraphs: paragraphs);
  }

  void changeText(int index, String text) {
    final currentState = state;
    if (currentState is ParagraphListStateData) {
      final paragraphs = currentState.paragraphs.toList()..[index] = text;
      state = currentState.copyWith(paragraphs: paragraphs);
    }
  }

  void insert(int index, String text) {
    final currentState = state;
    if (currentState is ParagraphListStateData) {
      final paragraphs = currentState.paragraphs.toList()..insert(index, text);
      state = currentState.copyWith(paragraphs: paragraphs);
    }
  }
}
