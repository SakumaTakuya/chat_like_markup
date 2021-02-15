import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../applications/memo_state.dart';

class MarkdownPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) => context.watch<MemoState>().when(
        (memo) => Text(memo.text),
        loading: () => const Center(child: CircularProgressIndicator()),
      );
}
