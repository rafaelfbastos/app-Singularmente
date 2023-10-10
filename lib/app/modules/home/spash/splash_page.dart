import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:lottie/lottie.dart';
import 'package:saudemental/app/core/store/app_store.dart';

class SplashPage extends StatefulWidget {
  final AppStore _appStore;
  
  const SplashPage({required AppStore store, super.key}) : _appStore = store;

  @override
  State<SplashPage> createState() => _SpashPageState();
}

class _SpashPageState extends State<SplashPage> {
  
  @override
  void initState() {
    
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async { 

     await widget._appStore.carregar();
    
      Modular.to.navigate('home');

    });

    super.initState();
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
              height: double.infinity,
              child: Center(child: Lottie.asset('assets/lotties/splash.json', fit: BoxFit.fill)),
            ),
    );
  }
}
