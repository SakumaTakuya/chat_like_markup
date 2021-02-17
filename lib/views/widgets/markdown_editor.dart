import 'dart:math';
import 'package:chat_like_markup/domains/paragraph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';
import '../../applications/paragraph_list_state.dart';
import '../../applications/edit_controller.dart';
import 'memo_block.dart';

class MarkdownEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final paragraphList = ParagraphList();
    final initialIndex = context.read<ParagraphListState>().maybeWhen(
          (paragraphs) => paragraphs.length - 1,
          orElse: () => 0,
        );

    assert(initialIndex > -1);
    return StateNotifierProvider<EditIndexController, int>(
      create: (_) => EditIndexController(initialIndex),
      child: Column(children: [
        Expanded(
          child: paragraphList,
        ),
        ParagraphEditor()
      ]),
    );
  }
}

class ParagraphList extends StatelessWidget {
  ParagraphList() : _scroller = ScrollController();

  final ScrollController _scroller;
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

  @override
  Widget build(BuildContext context) {
    final paragraphController = context.read<ParagraphsController>();
    final indexController = context.read<EditIndexController>();

    return context.watch<ParagraphListState>().when(
      (paragraphs) {
        final editIndex = context.watch<int>();
        return ReorderableListView(
          scrollController: _scroller,
          children: List.generate(paragraphs.length, (index) {
            final paragraph = paragraphs[index];
            return Card(
              key: Key('$index'),
              margin: const EdgeInsets.symmetric(vertical: 1.0),
              child: InkWell(
                onTap: () => indexController.seek(index),
                child: Container(
                  color: editIndex == index
                      ? Theme.of(context).accentColor
                      : Theme.of(context).cardColor,
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(child: Text(paragraph?.content)),
                      IconButton(
                        icon: const Icon(Icons.arrow_circle_down),
                        onPressed: () {
                          paragraphController.insert(index + 1, Paragraph(''));
                          indexController.seek(index + 1);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
          onReorder: (oldIndex, newIndex) {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            indexController.seek(newIndex);
            paragraphController.move(oldIndex, newIndex);
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

typedef void ParagraphEditorCallback(int index);

class ParagraphEditor extends StatelessWidget {
  // ParagraphEditor({this.onFocus});
  // final ParagraphEditorCallback onFocus;

  @override
  Widget build(BuildContext context) => context.read<ParagraphListState>().when(
        (paragraphs) {
          final length = paragraphs.length;
          final index = context.watch<int>();
          final text = length > 0 ? paragraphs[index]?.content : null;
          final editController = TextEditingController(text: text);

          return Container(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                const BoxShadow(
                  blurRadius: 4.0,
                  color: Colors.black26,
                ),
              ],
              color: Theme.of(context).colorScheme.background,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 200),
                  child: Scrollbar(
                    child: TextField(
                      autofocus: true,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      controller: editController,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        icon: Icon(Icons.check),
                        onPressed: () {
                          final paragraph = Paragraph(editController.text);
                          final paragraphController =
                              context.read<ParagraphsController>();

                          assert(index < length);
                          paragraphController.changeText(index, paragraph);

                          // edit last paragraph
                          if (index == length - 1) {
                            paragraphController.insert(length, Paragraph(''));
                          }

                          context.read<EditIndexController>().seek(index + 1);
                        }),
                  ],
                )
              ],
            ),
          );
        },
        loading: () => Container(),
      );
}

//   return context.watch<ParagraphListState>().when(
//     (paragraphs) {
//       print("read ${paragraphs.map((e) => e?.content).join('\t')}");
//       return ReorderableListView(
//         children: List.generate(paragraphs.length + 1, (index) {
//           if (index == paragraphs.length) {
//             return MemoBlockAdder(
//               key: Key('$index'),
//               onAdded: () {
//                 controller.insert(index, Paragraph("$index new "));
//                 focusIndex = index;
//               },
//             );
//           }

//           final paragraph = paragraphs[index];
//           // final focus = FocusNode();
//           final editController =
//               TextEditingController(text: paragraph?.content);
//           // focus.addListener(() {
//           //   if (!focus.hasFocus) {
//           //     final paragraph = Paragraph(editController.text);
//           //     // controller.changeText(index, paragraph);
//           //   }
//           // });
//           print("call $index, ${paragraphs[index]?.content}");
//           return Container(
//             padding: EdgeInsets.all(32),
//             color: Colors.red[100],
//             key: Key('$index'),
//             child: TextField(
//               autofocus: true,
//               maxLines: null,
//               // onChanged: (value) {
//               //   final paragraph = Paragraph(value);
//               //   if (paragraph.isEnd) {
//               //     print("test");
//               //     focus.unfocus();
//               //   }
//               // },
//               controller: editController,
//               // focusNode: focus,
//             ),
//           );

//           // return MemoBlock(
//           //   key: Key('$index'),
//           //   paragraph: paragraph,
//           //   onAdded: () {
//           //     controller.insert(index, null);
//           //     focusIndex = index;
//           //   },
//           //   onChanged: (value) => controller.changeText(index, value),
//           //   onEndedToInput: () => controller.insert(index + 1, null),
//           //   isInputState: index == focusIndex,
//           // );
//         }),
//         onReorder: controller.move,
//       );
//     },
//     loading: () => const Center(child: CircularProgressIndicator()),
//   );
// }
// }
