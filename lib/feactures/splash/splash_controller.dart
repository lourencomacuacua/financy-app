import 'package:finaceiro/feactures/splash/splash_state.dart';
import 'package:finaceiro/services/auth_service.dart';
import 'package:finaceiro/services/secure_storage.dart';
import 'package:flutter/material.dart';

class SplashController extends ChangeNotifier {
  final SecureStorage _service;
  SplashController(this._service);
  SplashState _state = SplashInitialState();
  SplashState get state => _state;

  void _changeState(SplashState newState) {
    _state = newState;
    notifyListeners();
  }

  void isUserLogged() async {
    await Future.delayed(const Duration(seconds: 1));
    final result = await _service.readOne(key: "CURRENT_USER");
    if (result != null) {
      _changeState(SplashSuccessState());
    } else {
      _changeState(SplashErrorState());
    }
  }
}
