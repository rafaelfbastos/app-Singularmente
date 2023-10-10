import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:saudemental/app/modules/home/contacts/contacts_store.dart';
import 'package:saudemental/app/modules/home/contacts/widgets/contacts_card.dart';
import 'package:saudemental/app/modules/home/widgets/botton_navigator.dart';

class ContactsPage extends StatefulWidget {
  final ContactsStore _store;

  const ContactsPage({required ContactsStore store, super.key})
      : _store = store;

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      widget._store.loadContacts();
    });

    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Procure ajuda"),
      ),
      bottomNavigationBar: const BottonNavigator(currentIndex: 2),
      body: Observer(
          builder: (context) => ListView(
                children: widget._store.contacts
                    .map((e) => ContactsCard(contacts: e))
                    .toList(),
              )),
    );
  }
}
