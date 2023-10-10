// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContactsStore on ContactsStoreBase, Store {
  late final _$contactsAtom =
      Atom(name: 'ContactsStoreBase.contacts', context: context);

  @override
  ObservableList<ContactsModel> get contacts {
    _$contactsAtom.reportRead();
    return super.contacts;
  }

  @override
  set contacts(ObservableList<ContactsModel> value) {
    _$contactsAtom.reportWrite(value, super.contacts, () {
      super.contacts = value;
    });
  }

  late final _$loadContactsAsyncAction =
      AsyncAction('ContactsStoreBase.loadContacts', context: context);

  @override
  Future<void> loadContacts() {
    return _$loadContactsAsyncAction.run(() => super.loadContacts());
  }

  @override
  String toString() {
    return '''
contacts: ${contacts}
    ''';
  }
}
