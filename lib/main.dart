import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'domains/markdown_paragraph.dart';
import 'infras/memo_data.dart';
import 'infras/hive_initializer.dart';
import 'infras/widgets/provider.dart';
import 'states/memo_list.dart';
import 'views/home.dart';
import 'views/edit.dart';
import 'views/theme.dart';

const isDebug = false;

Future<void> main() async {
  final database = await initDatabase(isDebug);
  runApp(MyApp(database));
}

Future<MemoDatabaseInHive> initDatabase(bool isDebug) async {
  final database = MemoDatabaseInHive();
  await HiveInitializer.initialize();

  if (isDebug) {
    await database.open();
    await database.box.deleteFromDisk();
  }

  await database.open();
  return database;
}

class MyApp extends StatelessWidget {
  MyApp(this.database);
  final MemoDatabaseInHive database;

  @override
  Widget build(BuildContext context) =>
      NotifierProvider<MemoListController, MemoListState>(
        childbuilder: (context) => MaterialApp(
          title: 'Chat Like Memo',
          theme: CustomTheme.lightTheme,
          debugShowCheckedModeBanner: isDebug,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          initialRoute: '/',
          onGenerateRoute: (settings) {
            final controller = Reader.of<MemoListController>(context);
            final routes = {
              '/': (_) => HomeView(
                    database,
                    controller,
                    controller,
                  ),
              '/edit': (_) => EditView(
                    settings.arguments,
                    database,
                    controller,
                    MarkdownParagraphCreater(),
                  ),
            };
            final builder = routes[settings.name];
            return CupertinoPageRoute(
                builder: (c) => builder(c), settings: settings);
          },
        ),
        notifierbuilder: (_) => MemoListController(
          database,
          database,
          database,
        ),
      );
}
