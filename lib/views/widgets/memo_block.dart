import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef void MemoBlockEvent();
typedef void MemoBlockInputEvent(String text);

class MemoBlockAdder extends StatelessWidget {
  MemoBlockAdder({this.onAdded});
  final MemoBlockEvent onAdded;

  @override
  Widget build(BuildContext context) => Card(
        child: FlatButton(
          child: const Center(
            child: const Icon(Icons.add),
          ),
          onPressed: onAdded,
        ),
      );
}

class MemoBlock extends StatefulWidget {
  MemoBlock({this.onAdded, this.onEndedToInput, this.text});
  final MemoBlockEvent onAdded;
  final MemoBlockInputEvent onEndedToInput;
  final String text;

  @override
  _MemoBlockState createState() =>
      _MemoBlockState(onAdded, onEndedToInput, text, text == null);
}

class _MemoBlockState extends State<MemoBlock> {
  _MemoBlockState(
      this.onAdded, this.onEndedToInput, String text, this.isInputState)
      : _textEditingController = TextEditingController(text: text ?? '');
  final MemoBlockEvent onAdded;
  final MemoBlockInputEvent onEndedToInput;

  bool isInputState;
  TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) => Card(
        child:
            isInputState ? _buildInputState(context) : _buildTileState(context),
      );

  Widget _buildTileState(BuildContext context) => InkWell(
        child: Container(
          padding:
              EdgeInsets.all(Theme.of(context).textTheme.bodyText1.fontSize),
          child: Row(
            children: [
              Text(
                _textEditingController.text,
                overflow: TextOverflow.ellipsis,
              ),
              IconButton(
                icon: const Icon(Icons.arrow_circle_up),
                onPressed: onAdded,
              )
            ],
          ),
        ),
        onTap: () => setState(() => isInputState = true),
      );

  Widget _buildInputState(BuildContext context) => Container(
      color: Theme.of(context).colorScheme.primaryVariant,
      padding: EdgeInsets.all(
        Theme.of(context).textTheme.bodyText1.fontSize / 2,
      ),
      child: GestureDetector(
        onTap: _unfocus,
        child: TextField(
          autofocus: true,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          onChanged: (value) {
            if (_isEndParagraph(value)) {
              onEndedToInput(value);
              setState(() => isInputState = false);
            }
          },
          controller: _textEditingController,
        ),
      ));

  bool _isEndParagraph(String text) => text.endsWith('\n\n');
  void _unfocus() {
    print('unfocus');
    // final FocusScopeNode currentScope = FocusScope.of(context);
    // FocusManager.instance.primaryFocus.unfocus();
    // setState(() => isInputState = false);
    // if (!currentScope.hasPrimaryFocus && currentScope.hasFocus) {
    //   FocusManager.instance.primaryFocus.unfocus();
    //   setState(() => isInputState = false);
    // }
  }
}
