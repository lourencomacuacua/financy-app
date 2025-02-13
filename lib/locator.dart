import 'package:finaceiro/feactures/sing_in/sing_in_controller.dart';
import 'package:finaceiro/feactures/sing_up/sing_up_controller.dart';
import 'package:finaceiro/feactures/splash/splash_controller.dart';
import 'package:finaceiro/services/auth_service.dart';
import 'package:finaceiro/services/firebase_auth_service.dart';
import 'package:finaceiro/services/mock_auth_service.dart';
import 'package:finaceiro/services/secure_storage.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup(
    {AuthService? authService,
    SecureStorage? secureStorage,
    SingUpController? signUpController}) {
  locator.registerLazySingleton<AuthService>(
      () => authService ?? FirebaseAuthService());

  locator.registerLazySingleton<SecureStorage>(
      () => secureStorage ?? SecureStorage());

  locator.registerFactory<SingUpController>(() => SingUpController(
        locator.get<AuthService>(),
        const SecureStorage(),
      ));

  locator.registerFactory<SingInController>(
      () => SingInController(locator.get<AuthService>()));

  locator.registerFactory<SplashController>(
      () => SplashController(locator.get<SecureStorage>()));
}
