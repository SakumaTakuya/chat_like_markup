import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import '../applications/memo_state.dart';
import '../applications/memo_list_state.dart';
import '../applications/paragraph_list_state.dart';
import '../domains/memo.dart';
import 'widgets/markdown_editor.dart';
import 'widgets/markdown_preview.dart';
import 'widgets/title_editor.dart';

class Edit extends StatelessWidget {
  Edit(this._memo);
  final Memo _memo;

  @override
  Widget build(BuildContext context) =>
      StateNotifierProvider<MemoController, MemoState>(
        create: (_) => MemoController(_memo),
        child: StateNotifierProvider<ParagraphsController, ParagraphListState>(
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
    final titleEditor = TitleEditor();

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: titleEditor,
          leading: BackButton(),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                _updateWithTitle(context, titleEditor.title);
                context.read<MemoState>().maybeWhen(
                      (memo) async =>
                          await context.read<MemoListController>().save(memo),
                      orElse: () {},
                    );
              },
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: _tabs,
            onTap: (index) {
              FocusScope.of(context).unfocus();
              if (index == 0) {
                return;
              }
              _updateWithTitle(context, titleEditor.title);
            },
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
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
      context.read<ParagraphListState>().maybeWhen(
            (paragraphs) => context.read<MemoController>().updateMemo(
                  title,
                  paragraphs,
                ),
            orElse: () => null,
          );
}
