import 'package:final_config_enviroment/bindings/app_binding.dart';
import 'package:final_config_enviroment/generated/l10n.dart';
import 'package:final_config_enviroment/global/theme/app_themes.dart';
import 'package:final_config_enviroment/routing/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  final ThemeMode themeMode;
  const MyApp({Key? key, required this.themeMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: themeMode,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.cupertino,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      initialBinding: AppBinding(),
      initialRoute: AppRouting.login,
      getPages: AppRouting.getPages,
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}
