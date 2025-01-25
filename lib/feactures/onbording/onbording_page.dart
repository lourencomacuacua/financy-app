import 'dart:math';

import 'package:finaceiro/common/constantns/app_colors.dart';
import 'package:finaceiro/common/constantns/app_text_styles.dart';
import 'package:finaceiro/common/constantns/widget/PrimaryButton.dart';
import 'package:finaceiro/common/routes.dart';
import 'package:finaceiro/feactures/sing_up/sing_up_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OnbordingPage extends StatelessWidget {
  const OnbordingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 30.0),
          Expanded(
            child: Container(
              color: AppColors.iceWhite,
              child: Image.asset('assets/images/man.png'),
            ),
          ),
          Text(
            'Spend Smarter',
            style: AppTextStyles.midiumText
                .copyWith(color: AppColors.greenlightTwo),
          ),
          Text(
            'Save More',
            style: AppTextStyles.midiumText
                .copyWith(color: AppColors.greenlightTwo),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Primarybutton(
              text: 'Get Started',
              onPressed: () {
                Navigator.pushNamed(context, NamesRoute.signUp);
              },
            ),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: 'Already have an account? ',
              style: AppTextStyles.smalText.copyWith(color: AppColors.grey),
              children: [
                TextSpan(
                  text: 'Log In',
                  style: AppTextStyles.smalText
                      .copyWith(color: AppColors.greenlightTwo),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.pushNamed(context, NamesRoute.signIn);
                    },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50.0,
          )
        ],
      ),
    );
  }
}
