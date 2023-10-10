import 'package:flutter_modular/flutter_modular.dart';
import 'package:saudemental/app/core/modules/core_module.dart';
import 'package:saudemental/app/core/store/app_store.dart';
import 'package:saudemental/app/modules/home/home_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds =>
      [Bind.singleton((i) => AppStore(pillsService: i(), informationsService: i()))];

  @override
  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  List<ModularRoute> get routes => [ModuleRoute("/", module: HomeModule())];
}
