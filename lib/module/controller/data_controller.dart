import 'package:get/get.dart';
import 'package:test_task/module/controller/base_controller.dart';
import 'package:test_task/utils/service/api/data_service.dart';
import '../model/data_model.dart';

class DataController extends GetxController with BaseController {
  var isLoading = false.obs;
  var dataInfo = DataModel().obs;
  var error = "".obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  void loadData() async {
    try {
      isLoading(true);
      final result = await DataService.instance.callData();

      if (result!=null) {
        dataInfo.value = result;
        // productList.assignAll(result);

      }
      update();
    } catch (e) {
      handleError(e);
    } finally {
      isLoading(false);
    }
  }
}
