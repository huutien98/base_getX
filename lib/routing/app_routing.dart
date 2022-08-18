import 'package:final_config_enviroment/ui/home/controller/home_binding.dart';
import 'package:final_config_enviroment/ui/home/page/home_page.dart';
import 'package:final_config_enviroment/ui/login/controller/login_binding.dart';
import 'package:final_config_enviroment/ui/login/page/login_page.dart';
import 'package:final_config_enviroment/ui/setting/controller/setting_binding.dart';
import 'package:final_config_enviroment/ui/setting/page/setting_page.dart';
import 'package:get/get.dart';

class AppRouting {
  static const String login = "/login";
  static const String home = "/home";
  static const String setting = "/setting";

  static final List<GetPage> getPages = [
    GetPage(name: login, page: () => const LoginPage(), binding: LoginBinding()),
    GetPage(name: home, page: () => const HomePage(), binding: HomeBinding()),
    GetPage(name: setting, page: () => const SettingPage(), binding: SettingBinding()),
  ];
}
