import 'dart:async';

import 'package:finaceiro/common/constantns/app_colors.dart';
import 'package:finaceiro/common/constantns/app_text_styles.dart';
import 'package:finaceiro/common/constantns/widget/custom_circular_progress_indicator.dart';
import 'package:finaceiro/common/routes.dart';
import 'package:finaceiro/feactures/onbording/onbording_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Chamando o método init() para iniciar o timer
    init();
  }

  Timer init() {
    return Timer(const Duration(seconds: 2), navigationToOnboarding);
  }

  void navigationToOnboarding() {
    Navigator.pushReplacementNamed(context, NamesRoute.initial);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.greenGradient,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('financy',
                  style:
                      AppTextStyles.bigText.copyWith(color: AppColors.white)),
              CustomCircularProgressIndicator(),
            ],
          )),
    );
  }
}
/*
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  Timer init() {
    return Timer(const Duration(seconds: 2), navigationToOnboarding);
  }

  void navigationToOnboarding() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const OnbordingPage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: AppColors.greenGradient,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('financy',
                  style:
                      AppTextStyles.bigText.copyWith(color: AppColors.white)),
              CustomCircularProgressIndicator(),
            ],
          )),
    );
  }
}
*/
