import '../domains/model.dart';
import '../domains/memo.dart';
import '../domains/paragraphs_memo_converter.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'paragraph_state.freezed.dart';

@freezed
abstract class ParagraphsState with _$ParagraphsState {
  const factory ParagraphsState({
    @Default([]) List<String> paragraphs,
  }) = ParagraphsStateData;
  const factory ParagraphsState.loading() = ParagraphsStateLoading;
}

class ParagraphsController extends StateNotifier<ParagraphsState>
    with LocatorMixin {
  ParagraphsController() : super(const ParagraphsState.loading());

  @override
  Future<void> initState() async {
    super.initState();
  }

  Future<void> buildParagraphs(Memo memo) async {
    final paragraphs = memo.splitIntoParagraphs();
    state = ParagraphsState(paragraphs: paragraphs);
  }

  void changeText(int index, String text) {
    final currentState = state;
    if (currentState is ParagraphsStateData) {
      final paragraphs = currentState.paragraphs.toList()..[index] = text;
      state = currentState.copyWith(paragraphs: paragraphs);
    }
  }

  void insert(int index, String text) {
    final currentState = state;
    if (currentState is ParagraphsStateData) {
      final paragraphs = currentState.paragraphs.toList()..insert(index, text);
      state = currentState.copyWith(paragraphs: paragraphs);
    }
  }
}
