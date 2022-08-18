import 'package:final_config_enviroment/model/enum/themes_mode.dart';
import 'package:final_config_enviroment/ui/setting/controller/setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  late SettingController _settingController;
  late ThemesMode _groupValue;

  @override
  void initState() {
    _settingController = Get.find();
    _groupValue = _settingController.themeMode.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      margin: const EdgeInsets.all(16),
      child: _buildThemeNightItem(),
    );
  }

  Widget _buildThemeNightItem() {
    return Obx(() => Column(
          children: <Widget>[
            ListTile(
              title: const Text('Light'),
              leading: Radio<ThemesMode>(
                value: ThemesMode.light,
                groupValue: _settingController.themeMode.value,
                onChanged: (ThemesMode? value) {
                  if (value != null) {
                    _settingController.changeTheme(value);
                  }
                },
              ),
            ),
            ListTile(
              title: const Text('Dark'),
              leading: Radio<ThemesMode>(
                value: ThemesMode.dark,
                groupValue: _settingController.themeMode.value,
                onChanged: (ThemesMode? value) {
                  if (value != null) {
                    _settingController.changeTheme(value);
                  }
                },
              ),
            ),
            ListTile(
              title: const Text('System'),
              leading: Radio<ThemesMode>(
                value: ThemesMode.system,
                groupValue: _settingController.themeMode.value,
                onChanged: (ThemesMode? value) {
                  if (value != null) {
                    _settingController.changeTheme(value);
                  }
                },
              ),
            ),
          ],
        ));
  }
}
