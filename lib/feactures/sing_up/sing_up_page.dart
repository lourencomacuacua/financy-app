import 'dart:developer';

import 'package:finaceiro/common/constantns/app_colors.dart';
import 'package:finaceiro/common/constantns/app_text_styles.dart';
import 'package:finaceiro/common/constantns/widget/PrimaryButton.dart';
import 'package:finaceiro/common/constantns/widget/custom_bottom_sheet.dart';
import 'package:finaceiro/common/constantns/widget/custom_circular_progress_indicator.dart';
import 'package:finaceiro/common/constantns/widget/custom_text_form_field.dart';
import 'package:finaceiro/common/constantns/widget/password_form_filed.dart';
import 'package:finaceiro/common/constantns/routes.dart';
import 'package:finaceiro/locator.dart';
import 'package:finaceiro/feactures/sing_up/sing_up_controller.dart';
import 'package:finaceiro/feactures/sing_up/sing_up_state.dart';
import 'package:finaceiro/services/mock_auth_service.dart';
import 'package:finaceiro/utils/validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();

  final _controller = locator.get<SingUpController>();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is SignUpLoadingState) {
        showDialog(
          context: context,
          barrierDismissible:
              false, // Impede que o usuário feche o diálogo manualmente
          builder: (context) => const CustomCircularProgressIndicator(),
        );
      } else {
        // Fecha o diálogo se o estado mudar para algo diferente de `SignUpLoadingState`
        if (Navigator.canPop(context)) {
          Navigator.pop(context);
        }
      }

      if (_controller.state is SignUpSuccessState) {
        Navigator.pushReplacementNamed(context, NamesRoute.home);
      }
      if (_controller.state is SignUpErrorState) {
        final error = _controller.state as SignUpErrorState;
        customModalBottomSheet(context,
            content: error.message); // Passa a mensagem do erro
      }
    });
  }

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
                  CustomTextFormField(
                    controller: _nameController,
                    labelText: "your name",
                    hintText: "enter your name",
                    validator: Validator.validateName,
                  ),
                  CustomTextFormField(
                    controller: _emailController,
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
                  _controller.singUp(
                    name: _nameController.text,
                    email: _emailController.text,
                    password: _passwordController.text,
                  );
                } else {
                  //     log("erro ao logar");
                }
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
        ],
      ),
    );
  }
}
