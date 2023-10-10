import 'package:mobx/mobx.dart';
import 'package:saudemental/app/core/store/app_store.dart';
import 'package:saudemental/app/models/informations_model.dart';
part 'informations_store.g.dart';

class InformationsStore = InformationsStoreBase with _$InformationsStore;

abstract class InformationsStoreBase with Store {
  final AppStore _appStore;

  InformationsStoreBase({required AppStore appStore}) : _appStore = appStore{
    informations.addAll(_appStore.informations);
  }
  @observable
  var informations = <InformationsModel>[].asObservable();


}
