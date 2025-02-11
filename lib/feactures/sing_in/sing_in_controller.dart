/*import 'dart:developer';

import 'package:finaceiro/feactures/sing_in/sing_in_state.dart';
import 'package:finaceiro/services/auth_service.dart';
import 'package:flutter/material.dart';

class SingInController extends ChangeNotifier {
  final AuthService _service;

  SingInController(this._service);
  SingInState _state = SignInInitialState();

  SingInState get state => _state;

  void _changeState(SingInState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> singIn({required String email, required String password}) async {
    _changeState(SignInLoadingState());
    try {
      await _service.signUp(email: email, password: password);
      log("");
      _changeState(SignInSuccessState());
    } catch (e) {
      _changeState(SignUpErrorState(e.toString()));
    }
  }
}
*/
import 'dart:developer';

import 'package:finaceiro/feactures/sing_in/sing_in_state.dart';
import 'package:finaceiro/services/auth_service.dart';
import 'package:finaceiro/services/secure_storage.dart';
import 'package:flutter/material.dart';

class SingInController extends ChangeNotifier {
  final AuthService _service;

  SingInController(this._service);
  SingInState _state = SignInInitialState();

  SingInState get state => _state;

  void _changeState(SingInState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> singIn({required String email, required String password}) async {
    const secureStorage = SecureStorage();
    _changeState(SignInLoadingState());
    try {
      final user = await _service.signUp(email: email, password: password);
      if (user.id != null) {
        await secureStorage.write(key: "CURRENT_USER", value: user.toJson());
        _changeState(SignInSuccessState());
      } else {
        throw Exception();
      }
    } catch (e) {
      _changeState(SignInErrorState(e.toString()));
    }
  }
}
