import 'package:final_config_enviroment/ui/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBottomMenu extends StatelessWidget {
  HomeBottomMenu({Key? key}) : super(key: key);

  final HomeController _homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
          ],
          currentIndex: _homeController.currentTab.value.index,
          onTap: (indexTab) {
            _homeController.changeHomeMenuTab(indexTab);
          },
          selectedItemColor: Colors.amber[800],
        );
      },
    );
  }
}
