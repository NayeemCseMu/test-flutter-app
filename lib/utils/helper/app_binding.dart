import 'package:get/get.dart';
import 'package:test_task/module/controller/app_controller.dart';
import 'package:test_task/module/controller/data_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppController>(() => AppController(), fenix: true);
    Get.lazyPut<DataController>(() => DataController(), fenix: true);
  }
}
