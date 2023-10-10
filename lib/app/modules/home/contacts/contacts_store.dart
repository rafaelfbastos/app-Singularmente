// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';
import 'package:saudemental/app/models/contacts_model.dart';

import 'package:saudemental/app/services/contacts_service.dart';

part 'contacts_store.g.dart';

class ContactsStore = ContactsStoreBase with _$ContactsStore;

abstract class ContactsStoreBase with Store {

  final ContactsService _service;

  ContactsStoreBase({
    required ContactsService service,
  }):_service=service;

  @observable
  var contacts = <ContactsModel>[].asObservable();


  @action
  Future<void> loadContacts() async {
    var list = await _service.findAll();
    contacts.clear();
    contacts.addAll(list);
  }
  

}
