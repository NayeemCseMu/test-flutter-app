import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppController extends GetxController{
  var navBarIndex = 1.obs;

  PageController pageController = PageController(
    initialPage: 1,
    viewportFraction: 1,
    keepPage: true

  );



  void changeNavItem(int index){
    pageController.animateToPage(index, duration: 300.milliseconds, curve: Curves.ease);
    navBarIndex(index);
    update();
  }
}