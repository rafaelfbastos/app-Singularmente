import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:markdown/markdown.dart' as mk;
import 'package:saudemental/app/models/informations_model.dart';

class InfoPage extends StatelessWidget {
  final InformationsModel _info;

  const InfoPage({required InformationsModel info, super.key}) : _info = info;

  @override
  Widget build(BuildContext context) {
    Color? customColor(String? hexColor) {
      if (hexColor != null) {
        hexColor = hexColor.replaceAll("#", "ff");
        var intColor = int.parse(hexColor, radix: 16);
        return Color(intColor);
      }
      return null;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: customColor(_info.themeColor),
        title: Text(_info.title),
      ),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (_info.img != null)
                    ? Image.network('${_info.img}')
                    : const SizedBox(
                        height: 10,
                      ),
                const SizedBox(
                  height: 30,
                ),
                HtmlWidget(
                  mk.markdownToHtml(_info.text),
                  customStylesBuilder: (element) {
                    if (element.localName == 'p') {
                      return {
                        'font-size': '16px',
                        'margin-top': '5px',
                        'text-align': 'justify',
                      };
                    }
                    return {
                      'text-align': 'justify',
                    };
                  },
                ),
              ],
            ),
          )),
    );
  }
}
