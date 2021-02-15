import 'package:chat_like_markup/domains/memo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import '../applications/memo_state.dart';
import '../applications/memo_list_state.dart';
import '../applications/paragraph_state.dart';

class Edit extends StatelessWidget {
  Edit(this._memo);
  final Memo _memo;

  @override
  Widget build(BuildContext context) =>
      StateNotifierProvider<MemoController, MemoState>(
        create: (_) => MemoController(_memo),
        child: StateNotifierProvider<ParagraphsController, ParagraphsState>(
          create: (_) => ParagraphsController()..buildParagraphs(_memo),
          child: EditPanel(),
        ),
      );
}

class EditPanel extends StatefulWidget {
  @override
  _EditPanelState createState() => _EditPanelState();
}

class _EditPanelState extends State<EditPanel>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  final List<Widget> _tabs = const [
    Tab(
      child: Text('edit'),
    ),
    Tab(
      child: Text('preview'),
    )
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final titleEditor = context.watch<MemoState>().when<Widget>(
          (memo) => TitleEditor(title: memo.title),
          loading: () => Text('loading...'),
        );

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: titleEditor,
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                if (titleEditor is TitleEditor) {
                  _updateWithTitle(context, titleEditor.title);
                }
                context.read<MemoState>().maybeWhen(
                      (memo) => context.read<MemoListController>().save(memo),
                      orElse: () {},
                    );
              },
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: _tabs,
            onTap: (index) {
              if (index == 0) {
                return;
              }
              FocusScope.of(context).unfocus();
              if (titleEditor is TitleEditor) {
                _updateWithTitle(context, titleEditor.title);
              }
            },
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            MarkdownEditor(),
            MarkdownPreview(),
          ],
        ),
      ),
    );
  }

  void _updateWithTitle(BuildContext context, String title) =>
      context.read<ParagraphsState>().maybeWhen(
            (paragraphs) => context.read<MemoController>().updateMemo(
                  title,
                  paragraphs,
                ),
            orElse: () => null,
          );
}

class TitleEditor extends StatelessWidget {
  TitleEditor({String title})
      : _textEditingController = TextEditingController(text: title);
  final TextEditingController _textEditingController;

  String get title => _textEditingController.text;

  @override
  Widget build(BuildContext context) => TextField(
        autofocus: false,
        maxLines: 1,
        controller: _textEditingController,
      );
}

class MarkdownEditor extends StatelessWidget {
  @override
  Widget build(BuildContext context) => context.watch<ParagraphsState>().when(
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

class MarkdownPreview extends StatelessWidget {
  @override
  Widget build(BuildContext context) => context.watch<MemoState>().when(
        (memo) => Text(memo.text),
        loading: () => const Center(child: CircularProgressIndicator()),
      );
}
