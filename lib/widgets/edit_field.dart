import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'generals/focusible_text_field.dart';
import 'generals/scrollable_container.dart';

typedef void SaveCallback(String text);
typedef void EditCallback();

class EditField extends StatelessWidget {
  EditField({this.controller, this.onSave, this.onEdit});
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
                onUnfocus: () => onSave(controller.text),
                onFocus: onEdit,
                controller: controller,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.check),
                  onPressed: () => onSave(controller.text),
                ),
              ],
            ),
          ],
        ),
      );
}
