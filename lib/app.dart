import 'package:finaceiro/feactures/onbording/onbording_page.dart';
import 'package:finaceiro/feactures/sing_up/sing_up_page.dart';
import 'package:finaceiro/feactures/splash/splash_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SingUpPage(),
    );
  }
}
