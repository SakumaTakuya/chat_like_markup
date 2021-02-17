import 'package:chat_like_markup/domains/paragraph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../applications/paragraph_list_state.dart';
import '../../applications/edit_index_state.dart';
import 'paragraph_card.dart';

class ParagraphList extends StatefulWidget {
  ParagraphList() : _state = _ParagraphListState();
  final _ParagraphListState _state;

  void animateTo(int index) => _state.animateTo(index);

  @override
  _ParagraphListState createState() => _state;
}

class _ParagraphListState extends State<ParagraphList> {
  ScrollController _scroller;

  void animateTo(int index) {}

  @override
  void initState() {
    super.initState();
    _scroller = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    final paragraphController = context.read<ParagraphsController>();
    final indexController = context.read<EditIndexController>();
    final editIndex = context.watch<EditIndexState>().value;

    return context.watch<ParagraphListState>().when(
          (paragraphs) => buildListView(
            context,
            _scroller,
            paragraphController,
            indexController,
            editIndex,
            paragraphs,
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
        );
  }

  @protected
  Widget buildListView(
    BuildContext context,
    ScrollController scroller,
    ParagraphsController paragraphController,
    EditIndexController indexController,
    int editIndex,
    List<Paragraph> paragraphs,
  ) =>
      ReorderableListView(
        scrollController: scroller,
        children: List.generate(
          paragraphs.length,
          (index) => ParagraphCard(
            key: Key('$index'),
            text: paragraphs[index]?.content,
            color: editIndex == index
                ? Theme.of(context).colorScheme.primaryVariant
                : Theme.of(context).cardColor,
            onTap: () => indexController.seek(index),
            onAdded: () {
              paragraphController.insert(index + 1, Paragraph(''));
              indexController.seek(index + 1);
            },
          ),
        ),
        onReorder: (oldIndex, newIndex) {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          indexController.seek(newIndex);
          paragraphController.move(oldIndex, newIndex);
        },
      );

  @override
  void dispose() {
    _scroller.dispose();
    super.dispose();
  }
}

// final List<GlobalKey> _keys = [];

// void animateTo(int index) {
//   print('animate');
//   final offset = _keys.take(index + 1).fold<double>(
//         0.0,
//         (prev, key) => prev + key.currentContext.size.height,
//       );
//   _scroller.animateTo(
//     offset,
//     duration: const Duration(milliseconds: 100),
//     curve: Curves.ease,
//   );
// }
