import 'package:final_config_enviroment/database/shared_preferences_helper.dart';
import 'package:final_config_enviroment/environment/app_config.dart';
import 'package:final_config_enviroment/repository/auth_repository.dart';
import 'package:final_config_enviroment/repository/network_repository.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl());
    Get.lazyPut<SharedPreferencesHelper>(() => SharedPreferencesHelper());
    Get.lazyPut<NetworkRepository>(() =>
        NetworkRepositoryImpl(baseUrl: AppConfig.of(Get.context!).baseUrl));
  }
}
