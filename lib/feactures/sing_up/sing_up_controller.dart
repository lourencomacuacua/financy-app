import 'dart:developer';

import 'package:finaceiro/feactures/sing_up/sing_up_state.dart';
import 'package:flutter/material.dart';

class SingUpController extends ChangeNotifier {
  SingUpState _state = SignUpInitialState();

  void _changeState(SingUpState newState) {
    _state = newState;
    notifyListeners();
  }

  SingUpState get state => _state;

  Future<bool> doSighUp() async {
    _changeState(SignUpLoadingState());
    try {
      await Future.delayed(const Duration(seconds: 2));

      throw Exception("Erro ao logar");
      log("Usuário logado");
      _changeState(SignUpSuccessState());
      return true;
    } catch (e) {
      _changeState(SignUpErrorState());
      return false;
    }
  }
}
