import 'package:get_it/get_it.dart';
import './Core/services/user_service.dart';
import './Core/services/login_service.dart';
import 'Core/services/api.dart';
import 'Core/services/authentication_service.dart';
import 'Core/viewmodels/comments_model.dart';
import 'Core/viewmodels/home_model.dart';
import 'Core/viewmodels/login_model.dart';
GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => AuthenticationService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => LoginModel());
  locator.registerFactory(() => HomeModel());
  locator.registerFactory(() => CommentsModel());
}