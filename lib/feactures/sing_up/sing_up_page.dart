import 'package:finaceiro/common/constantns/app_colors.dart';
import 'package:finaceiro/common/constantns/app_text_styles.dart';
import 'package:finaceiro/common/constantns/widget/PrimaryButton.dart';
import 'package:finaceiro/common/constantns/widget/custom_text_form_field.dart';
import 'package:finaceiro/common/constantns/widget/password_form_filed.dart';
import 'package:finaceiro/utils/validator.dart';
import 'package:flutter/material.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
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
          Image.asset('assets/images/man.png'),
          Form(
              key: _formKey,
              child: Column(
                children: [
                  /*
                  CustomTextFormField(
                    labelText: "your name",
                    hintText: "enter your name",
                    validator: Validator.validateName,
                  ),
                  */
                  CustomTextFormField(
                    labelText: "your e-mail",
                    hintText: "your@gmail.com",
                    validator: Validator.validateEmail,
                  ),
                  PasswordFormFiled(
                    controller: _passwordController,
                    labelText: "Choose your password",
                    hintText: "********",
                    validator: Validator.validatePassword,
                    helperText:
                        "Must have at leat 8 characters, 1 capital letter and 1 number",
                  ),
                  PasswordFormFiled(
                    labelText: "Confirm your password",
                    hintText: "********",
                    validator: (value) => Validator.validateConfirmPassword(
                        value, _passwordController.text),
                  )
                ],
              )),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
            child: Primarybutton(
              text: 'Sign Up',
              onPressed: () {
                final valid = _formKey.currentState != null &&
                    _formKey.currentState!.validate();
                if (valid) {
                  //   log("Continuar lógica de login");
                } else {
                  //     log("erro ao logar");
                }
              },
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
