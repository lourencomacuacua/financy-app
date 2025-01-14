import 'dart:developer';

import 'package:finaceiro/common/constantns/app_colors.dart';
import 'package:finaceiro/common/constantns/app_text_styles.dart';
import 'package:finaceiro/common/constantns/widget/PrimaryButton.dart';
import 'package:flutter/material.dart';

class SingUpPage extends StatelessWidget {
  const SingUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Text(
            'Spend Smarter',
            textAlign: TextAlign.center,
            style: AppTextStyles.midiumText
                .copyWith(color: AppColors.greenlightTwo),
          ),
          Text(
            'Save More',
            textAlign: TextAlign.center,
            style: AppTextStyles.midiumText
                .copyWith(color: AppColors.greenlightTwo),
          ),
          Container(
            child: Image.asset('assets/images/man.png'),
          ),
          TextFormField(),
          const TextField(),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Primarybutton(
              text: 'Sign Up',
              onPressed: () => log('tap'),
            ),
          ),
          Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Already have account? ',
                style: AppTextStyles.smalText.copyWith(color: AppColors.grey),
                children: [
                  TextSpan(
                    text: 'Log In',
                    style: AppTextStyles.smalText
                        .copyWith(color: AppColors.greenlightTwo),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
