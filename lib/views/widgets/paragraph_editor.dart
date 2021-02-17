import 'package:chat_like_markup/domains/paragraph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../applications/paragraph_list_state.dart';
import '../../applications/edit_index_state.dart';

typedef void ParagraphEditorCallback(int index);

class ParagraphEditor extends StatelessWidget {
  ParagraphEditor({this.onEdit});
  final ParagraphEditorCallback onEdit;

  @override
  Widget build(BuildContext context) => context.read<ParagraphListState>().when(
        (paragraphs) {
          final length = paragraphs.length;
          final index = context.watch<EditIndexState>().value;
          final text = length > 0 ? paragraphs[index]?.content : null;
          final editController = TextEditingController(text: text);
          final paragraphController = context.read<ParagraphsController>();
          final indexController = context.read<EditIndexController>();
          final save = () => _save(
                editController.text,
                index,
                length,
                paragraphController,
                indexController,
              );
          final edit = () => onEdit?.call(index);

          return buildEditor(context, save, edit, editController);
        },
        loading: () => Container(),
      );

  void _save(
    String text,
    int index,
    int length,
    ParagraphsController paragraphController,
    EditIndexController indexController,
  ) {
    final paragraph = Paragraph(text);
    assert(index < length);
    paragraphController.changeText(index, paragraph);

    // edit last paragraph
    if (index == length - 1) {
      paragraphController.insert(length, Paragraph(''));
    }

    indexController.seek(index + 1);
  }

  @protected
  Widget buildEditor(
    BuildContext context,
    VoidCallback onSave,
    VoidCallback onEdit,
    TextEditingController editController,
  ) =>
      Container(
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
            ScrollableContainer(
              child: FocusibleTextField(
                onUnfocus: onSave,
                onFocus: onEdit,
                controller: editController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.check),
                  onPressed: onSave,
                ),
              ],
            ),
          ],
        ),
      );
}

class ScrollableContainer extends StatelessWidget {
  const ScrollableContainer({this.maxHeight = 200, @required this.child});
  final double maxHeight;
  final Widget child;

  @override
  Widget build(BuildContext context) => ConstrainedBox(
        constraints: BoxConstraints(maxHeight: maxHeight),
        child: Scrollbar(
          child: child,
        ),
      );
}

typedef void FocusibleTextFieldCallback();

class FocusibleTextField extends StatefulWidget {
  FocusibleTextField({
    this.onFocus,
    this.onUnfocus,
    this.controller,
    this.autofocus = false,
    this.maxLines,
    this.keyboardType = TextInputType.multiline,
  });
  final FocusibleTextFieldCallback onFocus;
  final FocusibleTextFieldCallback onUnfocus;
  final TextEditingController controller;
  final bool autofocus;
  final int maxLines;
  final TextInputType keyboardType;

  @override
  _FocusibleTextFieldState createState() => _FocusibleTextFieldState();
}

class _FocusibleTextFieldState extends State<FocusibleTextField> {
  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()
      ..addListener(() {
        if (_focusNode.hasFocus) {
          widget.onFocus?.call();
        } else {
          widget.onUnfocus?.call();
        }
      });
  }

  // widget経由でアクセスしないとControllerが保持されてしまって変更することができない
  @override
  Widget build(BuildContext context) => TextField(
        autofocus: widget.autofocus,
        maxLines: widget.maxLines,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        focusNode: _focusNode,
      );

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
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
