import 'package:finaceiro/common/constantns/app_colors.dart';
import 'package:finaceiro/common/constantns/app_text_styles.dart';
import 'package:flutter/material.dart';

class Primarybutton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const Primarybutton({Key? key, this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.all(Radius.circular(34.0)),
      child: Ink(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(34.0)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: onPressed != null
                  ? AppColors.greenGradient
                  : AppColors.greyGradient,
            ),
          ),
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(34.0)),
            onTap: onPressed,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(34.0)),
              ),
              alignment: Alignment.center,
              height: 64.0,
              child: Text(text,
                  style: AppTextStyles.midiumText18
                      .copyWith(color: AppColors.white)),
            ),
          )),
    );
  }
}
