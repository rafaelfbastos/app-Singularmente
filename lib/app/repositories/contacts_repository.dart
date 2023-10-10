import 'package:saudemental/app/models/contacts_model.dart';

abstract class ContactsRepository {
  Future<List<ContactsModel>> findAll();

}