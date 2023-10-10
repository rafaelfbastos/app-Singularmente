import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:saudemental/app/app_module.dart';
import 'package:saudemental/app/app_widget.dart';
import 'package:saudemental/app/core/config/start_app_config.dart';

Future<void> main() async {
  await StartAppConfig().configureApp();
  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
