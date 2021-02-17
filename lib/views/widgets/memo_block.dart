import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../domains/paragraph.dart';

typedef void MemoBlockEvent();
typedef void MemoBlockInputEvent(Paragraph paragraph);

class MemoBlockAdder extends StatelessWidget {
  MemoBlockAdder({Key key, this.onAdded}) : super(key: key);
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
  const MemoBlock(
      {Key key,
      this.onAdded,
      this.onChanged,
      this.onEndedToInput,
      this.paragraph,
      this.isInputState})
      : super(key: key);
  final MemoBlockEvent onAdded;
  final MemoBlockEvent onEndedToInput;
  final MemoBlockInputEvent onChanged;
  final Paragraph paragraph;
  final bool isInputState;

  @override
  _MemoBlockState createState() {
    print("card text : ${paragraph?.content}");
    return _MemoBlockState(
        onAdded, onChanged, onEndedToInput, paragraph?.content, isInputState);
  }
}

class _MemoBlockState extends State<MemoBlock> {
  _MemoBlockState(
    this.onAdded,
    this.onChanged,
    this.onEndedToInput,
    this._text,
    this.isInputState,
  ) : _textEditingController = TextEditingController(text: _text ?? '');
  final MemoBlockEvent onAdded;
  final MemoBlockEvent onEndedToInput;
  final MemoBlockInputEvent onChanged;
  String _text;

  bool isInputState;
  TextEditingController _textEditingController;

  @override
  Widget build(BuildContext context) {
    return Card(
      child:
          isInputState ? _buildInputState(context) : _buildTileState(context),
    );
  }

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
        child: TextField(
          autofocus: true,
          maxLines: null,
          keyboardType: TextInputType.multiline,
          onChanged: (value) {
            final paragraph = Paragraph(value);
            onChanged(paragraph);

            if (!paragraph.isEnd) {
              return;
            }

            _textEditingController.text = paragraph.content;
            setState(() => isInputState = false);
            Focus.of(context).unfocus();
            onEndedToInput();
          },
          controller: _textEditingController,
        ),
      );
}
