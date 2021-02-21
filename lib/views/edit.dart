import 'package:chat_like_markup/domains/list_with_head.dart';
import 'package:chat_like_markup/domains/model.dart';
import 'package:chat_like_markup/domains/paragraph.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../domains/memo.dart';

import '../infras/widgets/provider.dart';
import '../states/editing_memo.dart';
import '../widgets/title_editor.dart';
import 'screens/editor.dart';
import 'screens/preview.dart';

class EditView extends StatefulWidget {
  EditView(this.memo, this.memoCreater, this.memoSaver, this.paragraphCreater);
  final Memo memo;
  final ModelCreater<Memo> memoCreater;
  final ModelSaver<Memo> memoSaver;
  final ParagraphCreater<Paragraph> paragraphCreater;

  @override
  _EditViewState createState() => _EditViewState();
}

class _EditViewState extends State<EditView>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) =>
      NotifierProvider<EditingMemoController, EditingMemoState>(
        childbuilder: (context) => GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: FocusScope.of(context).unfocus,
          child: Scaffold(
            appBar: buildAppBar(context),
            body: buildBody(context),
          ),
        ),
        notifierbuilder: (_) => EditingMemoController()
          ..initializeWith(widget.memo, widget.paragraphCreater),
      );

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @protected
  Widget buildAppBar(BuildContext context) => AppBar(
        title: Selector<EditingMemoState, String>(
          selector: (data) => data.maybeWhen(
            (key, title, sentence) => title,
            orElse: () => null,
          ),
          childbuilder: (_, data) => data == null
              ? Text(AppLocalizations.of(context).loading)
              : TitleEditor(
                  data,
                  onChange: (text) => _updateTitle(context, text),
                ),
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
          tabs: [
            Tab(
              child: Text(AppLocalizations.of(context).edit),
            ),
            Tab(
              child: Text(AppLocalizations.of(context).preview),
            ),
          ],
          onTap: (index) => FocusScope.of(context).unfocus(),
        ),
      );

  @protected
  Widget buildBody(BuildContext context) => TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          Selector<EditingMemoState, ListWithHead<Paragraph>>(
            childbuilder: (_, sentence) => sentence == null
                ? const Center(child: CircularProgressIndicator())
                : EditScreen(
                    widget.paragraphCreater,
                    Reader.of<EditingMemoController>(context),
                    sentence,
                  ),
            selector: (data) => data.maybeWhen(
              (key, title, sentence) => sentence,
              orElse: () => null,
            ),
          ),
          Selector<EditingMemoState, List<Paragraph>>(
            childbuilder: (_, sentence) => sentence == null
                ? Container()
                : PreviewScreen(text: sentence.makeSentence()),
            selector: (data) => data.maybeWhen(
              (key, title, sentence) => sentence.content,
              orElse: () => null,
            ),
          )
        ],
      );

  void _updateTitle(BuildContext context, String title) =>
      Reader.of<EditingMemoController>(context).updateTitle(title);

  Future<void> _trySave(BuildContext context) async =>
      await widget.memoSaver.save(Reader.of<EditingMemoController>(context)
          .buildMemo(widget.memoCreater));
}
