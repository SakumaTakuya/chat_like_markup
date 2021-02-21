import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'generals/focusible_text_field.dart';
import 'generals/scrollable_container.dart';

typedef void SaveCallback(String text);
typedef void EditCallback();

const tableString = '|    |    |\n'
    '|----|----|\n'
    '|    |    |';

class EditField extends StatelessWidget {
  EditField({
    @required this.controller,
    @required this.onSave,
    @required this.onEdit,
  })  : assert(controller != null),
        assert(onSave != null),
        assert(onEdit != null);
  final TextEditingController controller;
  final SaveCallback onSave;
  final EditCallback onEdit;

  @override
  Widget build(BuildContext context) => Container(
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
                onUnfocus: () {
                  if (controller.text.isNotEmpty) {
                    onSave(controller.text);
                  }
                },
                onFocus: onEdit,
                controller: controller,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      IconButton(
                          icon: const Icon(Icons.space_bar),
                          onPressed: () {
                            controller.text += "\t";
                            controller.selection = TextSelection.fromPosition(
                                TextPosition(offset: controller.text.length));
                          }),
                      IconButton(
                        icon: const Icon(Icons.table_view),
                        onPressed: () => controller.text += tableString,
                      )
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: () => onSave(controller.text),
                ),
              ],
            ),
          ],
        ),
      );
}
