import 'package:finaceiro/feactures/sing_in/sing_in_controller.dart';
import 'package:finaceiro/feactures/sing_up/sing_up_controller.dart';
import 'package:finaceiro/feactures/splash/splash_controller.dart';
import 'package:finaceiro/services/auth_service.dart';
import 'package:finaceiro/services/firebase_auth_service.dart';
import 'package:finaceiro/services/mock_auth_service.dart';
import 'package:finaceiro/services/secure_storage.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup({AuthService? authService}) {
  locator.registerLazySingleton<AuthService>(() =>
      authService ??
      FirebaseAuthService()); // Usa o mock se fornecido, senão o Firebase real

  locator.registerFactory<SplashController>(
      () => SplashController(const SecureStorage()));

  locator.registerFactory<SingInController>(
      () => SingInController(locator.get<AuthService>()));
  locator.registerFactory<SingUpController>(
      () => SingUpController(locator.get<AuthService>()));
}
