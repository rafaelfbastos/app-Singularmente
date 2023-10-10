import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:saudemental/app/modules/home/pills/home_store.dart';
import 'package:saudemental/app/modules/home/widgets/botton_navigator.dart';

class HomePage extends StatefulWidget {
  final HomeStore _store;

  const HomePage({super.key, required HomeStore store}) : _store = store;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottonNavigator(currentIndex: 0),
      body: Observer(
        builder: (context) => Stack(
          children: [
            SizedBox(
              height: double.infinity,
              child: Lottie.asset(widget._store.path, fit: BoxFit.fill),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  widget._store.pill?.text ?? "",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.justify,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
