import 'package:finaceiro/feactures/sing_in/sing_in_controller.dart';
import 'package:finaceiro/feactures/sing_up/sing_up_controller.dart';
import 'package:finaceiro/services/auth_service.dart';
import 'package:finaceiro/services/firebase_auth_service.dart';
import 'package:finaceiro/services/mock_auth_service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<AuthService>(() => FirebaseAuthService());
  locator.registerFactory<SingInController>(
      () => SingInController(locator.get<AuthService>()));
  locator.registerFactory<SingUpController>(
      () => SingUpController(locator.get<AuthService>()));
}
