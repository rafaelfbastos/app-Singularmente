import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:saudemental/app/core/helpers/environments.dart';
import 'package:saudemental/app/models/contacts_model.dart';
import 'package:url_launcher/url_launcher.dart';

class NumbersListeTile extends StatelessWidget {
  final Number _number;
  const NumbersListeTile({required Number number, super.key})
      : _number = number;

  @override
  Widget build(BuildContext context) {
   
    Future<void> _makePhoneCall(String phoneNumber) async {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      await launchUrl(launchUri);
    }

    return ListTile(
      title: Text(_number.number),
      leading: LottieBuilder.asset(Environments.lottiePath('telefone')),
      onTap: () async =>  await _makePhoneCall(_number.number),
    );
  }
}
