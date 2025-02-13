import 'package:finaceiro/common/model/user_model.dart';
import 'package:finaceiro/locator.dart';
import 'package:finaceiro/services/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../mock/mock_classes.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter/widgets.dart';

import 'package:finaceiro/locator.dart';
import 'package:finaceiro/common/model/user_model.dart';
import '../mock/mock_classes.dart';

void main() {
  late UserModel user;
  late MockFirebaseAuthService mockFirebaseAuthService;

  setUpAll(() {
    WidgetsFlutterBinding.ensureInitialized();
    mockFirebaseAuthService = MockFirebaseAuthService();
    user = UserModel(
      name: 'User',
      email: 'user@email.com',
      id: '1a2b3c4d5e',
    );

    setup(authService: mockFirebaseAuthService);
  });

  group('Tests sign ups', () {
    test('Test sign up success', () async {
      when(() => mockFirebaseAuthService.signUp(
            name: 'User',
            email: 'user@email.com',
            password: 'user@123',
          )).thenAnswer((_) async => user);

      final result = await mockFirebaseAuthService.signUp(
        name: 'User',
        email: 'user@email.com',
        password: 'user@123',
      );

      expect(result, user);
    });

    test('Test sign up failure', () async {
      when(() => mockFirebaseAuthService.signUp(
            name: 'User',
            email: 'user@email.com',
            password: 'user@123',
          )).thenThrow(
        Exception(),
      );

      expect(
        () => mockFirebaseAuthService.signUp(
          name: 'User',
          email: 'user@email.com',
          password: 'user@123',
        ),
        throwsException,
      );
    });
  });
}
