import 'package:final_config_enviroment/database/shared_preferences_helper.dart';
import 'package:final_config_enviroment/model/enum/themes_mode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  Rx<ThemesMode> themeMode = ThemesMode.light.obs;

  @override
  void onInit() async {
    await _loadThemeMode();
    super.onInit();
  }

  Future<void> _loadThemeMode() async {
    int mode = await SharedPreferencesHelper.getThemeMode();
    if (mode == 0) {
      themeMode.value = ThemesMode.light;
    } else if (mode == 1) {
      themeMode.value = ThemesMode.dark;
    } else {
      themeMode.value = ThemesMode.system;
    }
  }

  void changeTheme(ThemesMode newThemes) async {
    themeMode.value = newThemes;
    if (newThemes == ThemesMode.light) {
      Get.changeThemeMode(ThemeMode.light);
    } else if (newThemes == ThemesMode.dark) {
      Get.changeThemeMode(ThemeMode.dark);
    } else {
      Get.changeThemeMode(ThemeMode.system);
    }
    await SharedPreferencesHelper.setThemeMode(mode: newThemes.index);
  }
}
