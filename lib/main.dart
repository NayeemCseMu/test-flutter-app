import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/config/route/app_route.dart';
import 'package:test_task/constants/app_color.dart';
import 'package:test_task/utils/helper/app_binding.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Test',
      theme: ThemeData(
        primaryColor: kPrimary,
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppRoute.splashPage,
      getPages: AppRoute.getPage,
      initialBinding: AppBinding(),
    );
  }
}
