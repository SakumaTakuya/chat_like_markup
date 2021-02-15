import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../applications/paragraph_list_state.dart';
import 'memo_block.dart';

class MarkdownEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      context.watch<ParagraphListState>().when(
        (paragraphs) {
          return ListView.builder(
            itemCount: paragraphs.length + 1,
            itemBuilder: (context, index) {
              final controller = context.read<ParagraphsController>();

              if (index == paragraphs.length) {
                return MemoBlockAdder(
                  onAdded: () => controller.insert(index, null),
                );
              }

              return MemoBlock(
                text: paragraphs[index],
                onAdded: () => controller.insert(index, null),
                onEndedToInput: (value) {
                  controller.changeText(index, value);
                  controller.insert(index + 1, null);
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
      );
}
