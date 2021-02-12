import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'applications/memo_state.dart';
import 'infras/memo_data.dart';
import 'views/home.dart';

Future<void> main() async {
  final database = await initDatabase();
  runApp(MyApp(database));
}

Future<MemoDatabaseInHive> initDatabase() async {
  final database = MemoDatabaseInHive();
  await Hive.initFlutter();
  Hive.registerAdapter(MemoInHiveAdapter());
  await database.open();
  await database.box.deleteFromDisk();
  await database.open();
  return database;
}

class MyApp extends StatelessWidget {
  MyApp(this._database);
  final MemoDatabaseInHive _database;

  @override
  Widget build(BuildContext context) => StateNotifierProvider<
          MemosController<MemoInHive>, MemosState<MemoInHive>>(
        create: (_) => MemosController<MemoInHive>(
          _database,
          _database,
          _database,
        ),
        child: MaterialApp(
          title: 'Chat Like Memo',
          home: Home<MemoInHive>(_database),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
        ),
      );
}
