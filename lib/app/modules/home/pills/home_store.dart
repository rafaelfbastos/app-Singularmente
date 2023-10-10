// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

import 'package:saudemental/app/core/helpers/environments.dart';
import 'package:saudemental/app/core/store/app_store.dart';
import 'package:saudemental/app/models/pills_model.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  
  final AppStore _appStore;
  
  @observable
  PillsModel? pill;

  HomeStoreBase({required AppStore appStore}) : _appStore = appStore {
    pill = _appStore.pill;
  }

  

  @computed
  String get path => Environments.backgroudPath(pill?.background??0);
}
