import 'package:finaceiro/common/model/user_model.dart';
import 'package:finaceiro/feactures/sing_up/sing_up_controller.dart';
import 'package:finaceiro/feactures/sing_up/sing_up_state.dart';
import 'package:finaceiro/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mock/mock_classes.dart';

void main() {
  late SingUpController signUpController;
  late MockSecureStorage mockSecureStorage;
  late MockFirebaseAuthService mockFirebaseAuthService;
  late UserModel user;

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    mockFirebaseAuthService = MockFirebaseAuthService();
    mockSecureStorage = MockSecureStorage();
    signUpController =
        SingUpController(mockFirebaseAuthService, mockSecureStorage);
    user = UserModel(
      name: 'User',
      email: 'user@email.com',
      id: '1a2b3c4d5e',
    );

    setup(
      authService: mockFirebaseAuthService,
      secureStorage: mockSecureStorage,
      signUpController: signUpController,
    );
  });

  test('Tests signup controller sucess state', () async {
    expect(signUpController.state, isInstanceOf<SignUpInitialState>());

    when(() => mockSecureStorage.write(
          key: "CURRENT_USER",
          value: user.toJson(),
        )).thenAnswer((_) async {});

    when(() => mockFirebaseAuthService.signUp(
          name: 'User',
          email: 'user@email.com',
          password: 'user@123',
        )).thenAnswer((_) async => user);

    await signUpController.singUp(
      name: 'User',
      email: 'user@email.com',
      password: 'user@123',
    );

    expect(signUpController.state, isInstanceOf<SignUpSuccessState>());
  });

  test('Tests signup controller error state', () async {
    expect(signUpController.state, isInstanceOf<SignUpInitialState>());

    when(() => mockSecureStorage.write(
          key: "CURRENT_USER",
          value: user.toJson(),
        )).thenAnswer((_) async {});

    when(() => mockFirebaseAuthService.signUp(
          name: 'User',
          email: 'user@email.com',
          password: 'user@123',
        )).thenThrow(
      Exception(),
    );

    await signUpController.singUp(
      name: 'User',
      email: 'user@email.com',
      password: 'user@123',
    );

    expect(signUpController.state, isInstanceOf<SignUpErrorState>());
  });
}
