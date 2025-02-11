import 'dart:developer';

import 'package:finaceiro/common/model/user_model.dart';
import 'package:finaceiro/feactures/sing_up/sing_up_state.dart';
import 'package:finaceiro/services/auth_service.dart';
import 'package:finaceiro/services/secure_storage.dart';
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
    final secureStorage = const SecureStorage();
    _changeState(SignUpLoadingState());
    try {
      final user =
          await _service.signUp(name: name, email: email, password: password);
      if (user.id != null) {
        await secureStorage.write(key: "CURRENT_USER", value: user.toJson());
        _changeState(SignUpSuccessState());
      } else {
        throw Exception();
      }
    } catch (e) {
      _changeState(SignUpErrorState(e.toString()));
    }
  }
}
