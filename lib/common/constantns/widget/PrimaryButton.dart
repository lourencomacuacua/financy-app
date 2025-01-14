import 'package:finaceiro/common/constantns/app_colors.dart';
import 'package:finaceiro/common/constantns/app_text_styles.dart';
import 'package:flutter/material.dart';

class Primarybutton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const Primarybutton({Key? key, this.onPressed, required this.text})
      : super(key: key);

  final BorderRadius _borderRadius =
      const BorderRadius.all(Radius.circular(38.0));
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: _borderRadius,
      child: Ink(
          height: 54.0,
          decoration: BoxDecoration(
            borderRadius: _borderRadius,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: onPressed != null
                  ? AppColors.greenGradient
                  : AppColors.greyGradient,
            ),
          ),
          child: InkWell(
            borderRadius: _borderRadius,
            onTap: onPressed,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: _borderRadius,
              ),
              alignment: Alignment.center,
              child: Text(text,
                  style: AppTextStyles.midiumText20
                      .copyWith(color: AppColors.white)),
            ),
          )),
    );
  }
}
