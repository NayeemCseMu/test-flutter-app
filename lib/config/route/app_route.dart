import 'package:get/get.dart';
import 'package:test_task/module/view/splash_page.dart';

class AppRoute {
  AppRoute._();
  static final AppRoute _instance = AppRoute._();
  static AppRoute get instance => _instance;
  static const String splashPage = "/splash";


  static List<GetPage> getPage = [
    GetPage(name: splashPage, page: () => const SplashPage()),

  ];
}