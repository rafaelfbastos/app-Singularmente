import 'package:banner_listtile/banner_listtile.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:saudemental/app/models/informations_model.dart';

class InformationsListTitle extends StatelessWidget {
  final InformationsModel _information;

  const InformationsListTitle(
      {required InformationsModel information, super.key})
      : _information = information;

  @override
  Widget build(BuildContext context) {
    return BannerListTile(
      showBanner: false,
      imageContainerShapeZigzagIndex: 3,
      imageContainer: Lottie.asset('assets/lotties/info.json'),
      elevation: 5,
      backgroundColor: const Color(0xff00DDB3),
      title: Text(
        _information.title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              offset: Offset(2.0, 2.0),
              blurRadius: 3.0,
              color: Colors.black54,
            ),
          ],
        ),
      ),
      onTap: () => Navigator.of(context).pushNamed('/info',arguments: _information),
    );
  }
}
