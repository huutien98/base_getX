import 'package:final_config_enviroment/model/enum/load_status.dart';
import 'package:final_config_enviroment/model/login_response/login_response.dart';
import 'package:final_config_enviroment/repository/auth_repository.dart';
import 'package:final_config_enviroment/routing/app_routing.dart';
import 'package:final_config_enviroment/utils/handle_call_api.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var loadingStatus = LoadStatus.initial.obs;
  final AuthRepository _authRepository = Get.find();

  void login({required String email, required String password}) async {
    loadingStatus.value = LoadStatus.loading;

    handleActionWithError(methodCallApi: () async {
      LoginResponse response =
          await _authRepository.login(userName: email, passWord: password);
      loadingStatus.value = LoadStatus.success;
      Get.offAndToNamed(AppRouting.home);
    }, onError: () {
    });
  }
}
