import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:saudemental/app/core/helpers/environments.dart';
import 'package:saudemental/app/models/contacts_model.dart';
import 'package:saudemental/app/modules/home/contacts/widgets/numbers_liste_tile.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsCard extends StatelessWidget {
  final ContactsModel _contacts;

  const ContactsCard({required ContactsModel contacts, super.key})
      : _contacts = contacts;

  @override
  Widget build(BuildContext context) {
    Future<void> _launchInBrowser(String name) async {
      final url =
          Uri.parse("https://www.google.com/maps/search/?api=1&query=$name");

      if (!await launchUrl(
        url,
        mode: LaunchMode.externalApplication,
      )) {
        throw Exception('Could not launch $url');
      }
    }

    return Card(
      elevation: 5,
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(10),
            title: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: AutoSizeText(
                  _contacts.name,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  maxLines: 2,
                )),
            subtitle: Text(
              _contacts.description,
              textAlign: TextAlign.justify,
            ),
          ),
          ListTile(
            title: Text(_contacts.address),
            leading: LottieBuilder.asset(Environments.lottiePath('adress')),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Text(
                Environments.distance(_contacts.distance),
                style: const TextStyle(color: Colors.red),
              ),
            ),
            onTap: () => _launchInBrowser(_contacts.address),
          ),
          ..._contacts.numbers.map((e) => NumbersListeTile(number: e)).toList()
        ],
      ),
    );
  }
}
