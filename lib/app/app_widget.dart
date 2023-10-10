import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:saudemental/app/core/ui/ui_config.dart';

class AppWidget extends StatelessWidget {

  const AppWidget({ super.key });

   @override
   Widget build(BuildContext context) {
       return MaterialApp.router(
      title: UiConfig.appTitle,
      theme: UiConfig.theme,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
    ); //added by exte
    
  }  
}