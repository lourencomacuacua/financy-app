import 'dart:developer';

import 'package:finaceiro/common/model/user_model.dart';
import 'package:finaceiro/feactures/sing_up/sing_up_state.dart';
import 'package:finaceiro/services/auth_service.dart';
import 'package:flutter/material.dart';

class SingUpController extends ChangeNotifier {
  final AuthService _service;
  SingUpController(this._service);
  SingUpState _state = SignUpInitialState();

  void _changeState(SingUpState newState) {
    _state = newState;
    notifyListeners();
  }

  SingUpState get state => _state;

  Future<void> singUp(
      {required String name,
      required String email,
      required String password}) async {
    _changeState(SignUpLoadingState());
    try {
      await _service.signUp(name: name, email: email, password: password);
      log("Usuário criado com sucesso!");
      _changeState(SignUpSuccessState());
    } catch (e) {
      _changeState(SignUpErrorState(e.toString()));
    }
  }
}
