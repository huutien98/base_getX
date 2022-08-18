import 'package:final_config_enviroment/model/enum/home_menu_item.dart';
import 'package:final_config_enviroment/routing/app_routing.dart';
import 'package:final_config_enviroment/ui/home/controller/home_controller.dart';
import 'package:final_config_enviroment/ui/home/page/business_tab_page.dart';
import 'package:final_config_enviroment/ui/home/page/home_tab_page.dart';
import 'package:final_config_enviroment/ui/home/page/scroll_tab_page.dart';
import 'package:final_config_enviroment/ui/home/widget/home_bottom_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final HomeController _homeController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(AppRouting.setting);
            },
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body:
          Obx(() => _buildCurrentTabSelected(_homeController.currentTab.value)),
      bottomNavigationBar: HomeBottomMenu(),
    );
  }

  Widget _buildCurrentTabSelected(HomeMenuItem currentTab) {
    return IndexedStack(
      index: currentTab.index,
      children: [
        const HomeTabPage(),
        BusinessTabPage(),
        const SchoolTabPage()
      ],
    );
  }
}
