import 'package:get/get.dart';

class AppController extends GetxController{
  var navBarIndex = 0.obs;

  void changeNavItem(int index){
    navBarIndex(index);
    update();
  }
}