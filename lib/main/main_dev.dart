import 'package:final_config_enviroment/database/shared_preferences_helper.dart';
import 'package:final_config_enviroment/environment/app_config.dart';
import 'package:final_config_enviroment/main/my_app.dart';
import 'package:final_config_enviroment/utils/const.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeMode currentTheme = ThemeMode.light;
  int userTheme = await SharedPreferencesHelper.getThemeMode();
  if(userTheme == 0) {
    currentTheme = ThemeMode.light;
  }else if(userTheme == 1) {
    currentTheme = ThemeMode.dark;
  }else {
    currentTheme = ThemeMode.system;
  }
  final AppConfig configuredApp = AppConfig(
      child: MyApp(themeMode: currentTheme,),
      environment: Environment.dev,
      baseUrl: Const.baseUrlStg);

  runApp(configuredApp);
}

void setupFireBase() async {
/*  await Firebase.initializeApp();
  *//*FirebaseMessaging.onBackgroundMessage(
      (message) => _firebaseMessagingBackgroundHandler(message));*/
}
