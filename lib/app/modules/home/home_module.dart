import 'package:flutter_modular/flutter_modular.dart';
import 'package:saudemental/app/modules/home/contacts/contacts_page.dart';
import 'package:saudemental/app/modules/home/contacts/contacts_store.dart';
import 'package:saudemental/app/modules/home/infomations/informations_page.dart';
import 'package:saudemental/app/modules/home/infomations/informations_store.dart';
import 'package:saudemental/app/modules/home/infomations/widget/info_page.dart';
import 'package:saudemental/app/modules/home/pills/home_page.dart';
import 'package:saudemental/app/modules/home/pills/home_store.dart';
import 'package:saudemental/app/modules/home/spash/splash_page.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => HomeStore(appStore: i())),
        Bind.lazySingleton((i) => InformationsStore(appStore: i())),
        Bind.lazySingleton((i) => ContactsStore(service: i()))
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/home',
            child: (context, args) => HomePage(store: context.read()),
            transition: TransitionType.noTransition),
        ChildRoute(Modular.initialRoute,
            child: (context, _) => SplashPage(store: context.read())),
        ChildRoute('/informations',
            child: (context, _) => InformationsPage(
                  store: context.read(),
                ),
            transition: TransitionType.noTransition),
        ChildRoute('/contacts',
            child: (context, _) => ContactsPage(
                  store: context.read(),
                ),
            transition: TransitionType.noTransition),
        ChildRoute('/info',
            child: (context, args) => InfoPage(info: args.data)),
      ];
}
