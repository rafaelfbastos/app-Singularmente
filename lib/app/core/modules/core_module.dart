import 'package:flutter_modular/flutter_modular.dart';
import 'package:saudemental/app/repositories/contacts_repository.dart';
import 'package:saudemental/app/repositories/contacts_repository_impl.dart';
import 'package:saudemental/app/repositories/informations_repository.dart';
import 'package:saudemental/app/repositories/informations_repository_impl.dart';
import 'package:saudemental/app/repositories/pills_repository.dart';
import 'package:saudemental/app/repositories/pills_repository_impl.dart';
import 'package:saudemental/app/services/contacts_service.dart';
import 'package:saudemental/app/services/contacts_service_impl.dart';
import 'package:saudemental/app/services/informations_service.dart';
import 'package:saudemental/app/services/informations_service_impl.dart';
import 'package:saudemental/app/services/pills_service.dart';
import 'package:saudemental/app/services/pills_service_impl.dart';

class CoreModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<PillsRepository>((i) => PillsRepositoryImpl(),
            export: true),
        Bind.lazySingleton<PillsService>(
            (i) => PillsServiceImpl(pillsRepository: i()),
            export: true),
        Bind.lazySingleton<InformationsRepository>(
            (i) => InformationsRepositoryImpl(),
            export: true),
        Bind.lazySingleton<InformationsService>(
            (i) => InformationsServiceImpl(repository: i()),
            export: true),
        Bind.lazySingleton<ContactsRepository>((i) => ContactsRepositoryImpl(),export: true),
        Bind.lazySingleton<ContactsService>(
            (i) => ContactsServiceImpl(repository: i()),export: true),
      ];
}
