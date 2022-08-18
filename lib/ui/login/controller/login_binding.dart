import 'package:final_config_enviroment/ui/login/controller/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.create(() => LoginController());
  }
}