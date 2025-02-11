import 'dart:async';
import 'dart:developer';

import 'package:finaceiro/common/constantns/app_colors.dart';
import 'package:finaceiro/common/constantns/app_text_styles.dart';
import 'package:finaceiro/common/constantns/widget/custom_circular_progress_indicator.dart';
import 'package:finaceiro/common/constantns/routes.dart';
import 'package:finaceiro/feactures/onbording/onbording_page.dart';
import 'package:finaceiro/feactures/splash/splash_controller.dart';
import 'package:finaceiro/feactures/splash/splash_state.dart';
import 'package:finaceiro/locator.dart';
import 'package:finaceiro/services/secure_storage.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _splashController = locator.get<SplashController>();
  @override
  void initState() {
    super.initState();
    _splashController.isUserLogged();
    _splashController.addListener(() {
      if (_splashController.state is SplashSuccessState) {
        Navigator.pushReplacementNamed(context, NamesRoute.home);
      } else {
        Navigator.pushReplacementNamed(context, NamesRoute.initial);
      }
    });
  }

  @override
  void dispose() {
    _splashController.dispose();
    super.dispose();
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
