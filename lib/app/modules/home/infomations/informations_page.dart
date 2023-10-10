import 'package:flutter/material.dart';
import 'package:saudemental/app/modules/home/infomations/informations_store.dart';
import 'package:saudemental/app/modules/home/infomations/widget/informations_list_title.dart';
import 'package:saudemental/app/modules/home/widgets/botton_navigator.dart';

class InformationsPage extends StatelessWidget {
  final InformationsStore _store;
  
  const InformationsPage({required InformationsStore store, super.key}) : _store = store;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottonNavigator(currentIndex: 1),
      appBar: AppBar(
        title: const Text('Saiba Mais'),
      ),
      body:Padding(
        padding: const EdgeInsets.only(top: 4),
        child: ListView(children: _store.informations.map((e) => Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: InformationsListTitle(information: e))).toList()),
      ) ,
    );
  }
}
