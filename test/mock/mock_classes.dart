import 'package:finaceiro/feactures/sing_up/sing_up_controller.dart';
import 'package:finaceiro/services/auth_service.dart';
import 'package:finaceiro/services/secure_storage.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuthService extends Mock implements AuthService {}

class MockSecureStorage extends Mock implements SecureStorage {}

class MockSignUpController extends Mock implements SingUpController {}
