
import 'package:get_it/get_it.dart';

import 'network/api_controller/user_controller.dart';
import 'network/api_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<ApiService>(ApiService());
  locator.registerLazySingleton(() => UserController());
}
