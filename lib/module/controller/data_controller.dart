import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/module/controller/base_controller.dart';
import 'package:test_task/module/model/data_model.dart';
import 'package:test_task/utils/service/api/data_service.dart';

class DataController extends GetxController with BaseController {
  var isLoading = false.obs;
  var dataInfo = DataModel();

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() async {
    try {
      isLoading(true);
      final result = await DataService.instance.callData();
      if (result != null) {
        dataInfo = result;
      }
      update();
    } catch (e) {
      handleError(e);
    } finally {
      isLoading(false);
    }
  }
}
