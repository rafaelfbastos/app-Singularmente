import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottonNavigator extends StatelessWidget {
  final int currentIndex;

  const BottonNavigator({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          if (value != currentIndex) {
            switch (value) {
              case 0:
                Modular.to.navigate('/home');
                break;
              case 1:
                Modular.to.navigate('/informations');
              case 2:
                Modular.to.navigate('/contacts');
                break;
            }
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.noteSticky), label: "Notas"),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.circleInfo), label: 'Informações'),
          BottomNavigationBarItem(icon: Icon(FontAwesomeIcons.handshakeAngle), label: 'Ajuda')
        ]);
  }
}
