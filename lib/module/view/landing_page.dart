import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/constants/app_constants.dart';
import 'package:test_task/module/controller/app_controller.dart';
import 'package:test_task/module/controller/data_controller.dart';
import 'package:test_task/module/view/explore/explore.dart';
import '../../widgets/bottom_nav.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController data = Get.find();
    return GetBuilder<AppController>(
      init: AppController(),
      builder: (appCtrl) {
        return Scaffold(
          body: SafeArea(
            child: PageView.builder(
              controller: appCtrl.pageController,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: navItems.length,
              itemBuilder: (context, index) {
                return getPage(index);
              },
            ),
          ),
          bottomNavigationBar: BottomNav(),
        );
      },
    );
  }

  getPage(int index) {
    switch (index) {
      case 0:
        return const Center(child: Text("Home"));
      case 1:
        return const Explore();
      case 2:
        return const Center(child: Text("Add"));
      case 3:
        return const Center(child: Text("Inbox"));
      case 4:
        return const Center(child: Text("Shop"));
      default:
        break;
    }
  }
}
