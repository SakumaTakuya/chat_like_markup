import 'package:chat_like_markup/applications/memo_list_state.dart';
import 'package:chat_like_markup/domains/list_with_head.dart';
import 'package:chat_like_markup/domains/model.dart';
import 'package:chat_like_markup/domains/paragraph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../domains/memo.dart';

import '../infras/widgets/provider.dart';
import '../states/editing_memo.dart';
import '../screens/editor.dart';
import '../screens/preview.dart';
import '../widgets/title_editor.dart';
import '../domains/paragraphs_memo_converter.dart';

class EditView extends StatefulWidget {
  EditView(this.memo, this.memoCreater, this.paragraphCreater);
  final Memo memo;
  final ModelCreater<Memo> memoCreater;
  final ParagraphCreater<Paragraph> paragraphCreater;

  @override
  _EditViewState createState() => _EditViewState();
}

class _EditViewState extends State<EditView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  EditingMemoController _editingMemoController;
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
  void didUpdateWidget(covariant EditView oldWidget) {
    super.didUpdateWidget(oldWidget);
    _editingMemoController = EditingMemoController()
      ..initializeWith(widget.memo, widget.paragraphCreater);
  }

  @override
  Widget build(BuildContext context) => NotifierProvider(
        childbuilder: (context) => buildScaffold(context),
        notifier: _editingMemoController,
      );

  @protected
  Widget buildScaffold(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: FocusScope.of(context).unfocus,
        child: Scaffold(
          appBar: AppBar(
            title: Selector<EditingMemoState, String>(
              selector: (data) => data.maybeWhen(
                (key, title, sentence) => title,
                orElse: null,
              ),
              childbuilder: (_, data) =>
                  data == null ? Text('loading') : TitleEditor(data),
            ),
            leading: BackButton(),
            actions: [
              IconButton(
                icon: Icon(Icons.save),
                onPressed: () => _trySave(context),
              ),
            ],
            bottom: TabBar(
              controller: _tabController,
              tabs: _tabs,
              onTap: (index) => FocusScope.of(context).unfocus(),
            ),
          ),
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              Selector<EditingMemoState, ListWithHead<Paragraph>>(
                childbuilder: (_, sentence) => sentence == null
                    ? const Center(child: CircularProgressIndicator())
                    : EditScreen(
                        widget.paragraphCreater,
                        _editingMemoController,
                        sentence,
                      ),
                selector: (data) => data.maybeWhen(
                  (key, title, sentence) => sentence,
                  orElse: null,
                ),
              ),
              Selector<EditingMemoState, List<Paragraph>>(
                childbuilder: (_, sentence) => sentence == null
                    ? Container()
                    : PreviewScreen(text: sentence.makeSentence()),
                selector: (data) => data.maybeWhen(
                  (key, title, sentence) => sentence.content,
                  orElse: null,
                ),
              )
            ],
          ),
        ),
      );

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _editingMemoController.dispose();
  }

  Future<void> _trySave(BuildContext context) async =>
      await Reader.of<MemoListController>(context)
          .save(_editingMemoController.buildMemo(widget.memoCreater));
}
