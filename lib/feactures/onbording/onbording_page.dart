import 'dart:math';

import 'package:finaceiro/common/constantns/app_colors.dart';
import 'package:finaceiro/common/constantns/app_text_styles.dart';
import 'package:finaceiro/common/constantns/widget/PrimaryButton.dart';
import 'package:flutter/material.dart';

class OnbordingPage extends StatelessWidget {
  const OnbordingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 0.0),
          Expanded(
            flex: 2,
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
          SizedBox(
            height: 16.0,
          ),
          Primarybutton(
            text: 'Get Started',
            onPressed: () {},
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            'Already have account> Log In',
            style: AppTextStyles.smalText.copyWith(color: AppColors.grey),
          ),
          const SizedBox(
            height: 40.0,
          )
        ],
      ),
    );
  }
}
