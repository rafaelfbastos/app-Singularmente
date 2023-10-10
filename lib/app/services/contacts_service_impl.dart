// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:saudemental/app/core/location/location.dart';
import 'package:saudemental/app/models/contacts_model.dart';
import 'package:saudemental/app/repositories/contacts_repository.dart';
import 'package:saudemental/app/services/contacts_service.dart';

class ContactsServiceImpl implements ContactsService {
  final ContactsRepository _repository;
  ContactsServiceImpl({
    required ContactsRepository repository,
  }) : _repository = repository;

  @override
  Future<List<ContactsModel>> findAll() async {
    var contacts = await _repository.findAll();
    var contactsFull =<ContactsModel>[];

    for (var contact in contacts) {
      var distance =
          await Location.distance(contact.latitude, contact.longitude);

       contactsFull.add(contact.copyWith(distance: distance));
    }

    

    contactsFull.sort((a, b) {
      if (a.distance == null && b.distance == null)
        return 0; // Ambos são nulos, considerados iguais.
      if (a.distance == null) return 1; // Valor nulo é considerado maior.
      if (b.distance == null) return -1; // Valor não nulo é considerado maior.
      return a.distance!.compareTo(b.distance!);
    });

    return contactsFull;
  }
}
