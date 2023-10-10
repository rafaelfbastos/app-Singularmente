import 'package:saudemental/app/models/contacts_model.dart';

abstract class ContactsService {
  Future<List<ContactsModel>> findAll();
}
