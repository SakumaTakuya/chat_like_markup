import 'package:chat_like_markup/domains/paragraph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import '../../applications/paragraph_list_state.dart';
import '../../applications/edit_index_state.dart';
import 'paragprah_list.dart';
import 'paragraph_editor.dart';

class MarkdownEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final initialIndex = context.read<ParagraphListState>().maybeWhen(
          (paragraphs) => paragraphs.length - 1,
          orElse: () => 0,
        );
    return buildScreen(initialIndex);
  }

  @protected
  Widget buildScreen(int initialIndex) =>
      StateNotifierProvider<EditIndexController, EditIndexState>(
        create: (_) => EditIndexController(initialIndex),
        child: Column(children: [
          Expanded(child: ParagraphList()),
          ParagraphEditor(),
        ]),
      );
}
