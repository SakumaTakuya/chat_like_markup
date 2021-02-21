import 'package:chat_like_markup/domains/list_with_head.dart';
import 'package:chat_like_markup/domains/paragraph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'paragraph_card.dart';

typedef void SelectCallback(int index);
typedef void ReorderCallback(int oldIndex, int newIndex);

class ParagraphList extends StatefulWidget {
  ParagraphList(
    this.sentence, {
    this.onSelect,
    this.onInsert,
    this.onReorder,
  }) : _state = _ParagraphListState();
  final ListWithHead<Paragraph> sentence;
  final SelectCallback onSelect;
  final SelectCallback onInsert;
  final ReorderCallback onReorder;
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
  Widget build(BuildContext context) => ReorderableListView(
        scrollController: _scroller,
        children: List.generate(
          widget.sentence.content.length,
          (index) => ParagraphCard(
            key: Key('$index'),
            text: widget.sentence.content[index]?.content,
            color: widget.sentence.head == index
                ? Theme.of(context).colorScheme.primaryVariant
                : Theme.of(context).cardColor,
            onTap: () => widget.onSelect(index),
            onAdded: () => widget.onInsert(index),
          ),
        ),
        onReorder: widget.onReorder,
      );

  @override
  void dispose() {
    _scroller.dispose();
    super.dispose();
  }
}
