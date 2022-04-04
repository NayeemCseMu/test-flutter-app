import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/config/route/app_route.dart';
import 'package:test_task/constants/app_size.dart';
import 'package:test_task/module/controller/data_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Future.delayed(3.seconds).then((value) => Get.offAndToNamed(AppRoute.explorePage));
  }
  @override
  Widget build(BuildContext context) {
    DataController data = Get.find();
    return Scaffold(
      body: OrientationBuilder(
        builder: (context,orientation) {
          ResponsiveSize.init(context, orientation);
          return Column(children: [],);
        }
      ),
    );
  }
}
