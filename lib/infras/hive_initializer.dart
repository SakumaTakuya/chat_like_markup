import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'memo_data.dart';

class HiveInitializer {
  static final adapterList = [
    MemoInHiveAdapter(),
  ];

  static Future<void> initialize() async {
    await Hive.initFlutter();
    adapterList.forEach((element) => Hive.registerAdapter(element));
  }
}
