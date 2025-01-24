import 'dart:developer';

import 'package:finaceiro/common/constantns/widget/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class PasswordFormFiled extends StatefulWidget {
  final TextEditingController? controller;
  final EdgeInsetsGeometry? padding;
  final String? hintText;
  final String? labelText;
  final FormFieldValidator<String>? validator;
  final String? helperText;

  const PasswordFormFiled({
    super.key,
    this.controller,
    this.padding,
    this.hintText,
    this.labelText,
    this.validator,
    this.helperText,
  });

  @override
  State<PasswordFormFiled> createState() => _PasswordFormFiledState();
}

class _PasswordFormFiledState extends State<PasswordFormFiled> {
  bool isHidden = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      helperText: widget.helperText,
      validator:
          widget.validator, // Validação repassada para o CustomTextFormField
      obscureText: isHidden, // Controle de visibilidade do texto
      controller: widget.controller,
      padding: widget.padding,
      hintText: widget.hintText,
      labelText: widget.labelText,
      sufixIcon: InkWell(
        borderRadius: BorderRadius.circular(23.0),
        onTap: () {
          setState(() {
            isHidden = !isHidden; // Alterna entre ocultar e mostrar a senha
          });
        },
        child: Icon(
          isHidden ? Icons.visibility : Icons.visibility_off,
        ),
      ),
    );
  }
}
