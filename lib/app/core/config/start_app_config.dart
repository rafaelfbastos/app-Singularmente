import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:saudemental/app/models/pills_model.dart';

class StartAppConfig {
  
  
  Future<void> configureApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _starHive();
  }

  Future<void> _starHive() async {
    Directory appDir = await getApplicationDocumentsDirectory();
    Hive.registerAdapter(PillsModelAdapter());
    await Hive.initFlutter(appDir.path);
    await Hive.openBox('settings');
    await Hive.openBox<PillsModel>('pills');

  }
}
