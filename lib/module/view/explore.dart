import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_task/constants/app_color.dart';
import 'package:test_task/constants/app_constants.dart';
import 'package:test_task/constants/app_size.dart';
import 'package:test_task/constants/app_text.dart';
import 'package:test_task/constants/assets_path.dart';
import 'package:test_task/module/controller/app_controller.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppController appCtrl = Get.find();
    return Obx(() {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                      fillColor: kBoxColor,
                      filled: true,
                      border: buildOutlineInputBorder,
                      enabledBorder: buildOutlineInputBorder,
                      focusedBorder: buildOutlineInputBorder,
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: SvgPicture.asset(
                          searchIcon,
                          // height: getScreeWidth(20),
                          // width: getScreeWidth(20),
                        ),
                      ),
                      hintText: searchHint,
                      hintStyle: TextStyle(
                        fontSize: getTextSize(14),
                        fontWeight: FontWeight.w400,
                        color: kLightText,
                      )),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: getScreenHeight(80),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              offset: const Offset(0, -2),
              blurRadius: 15,
              color: Colors.black.withOpacity(0.1),
            )
          ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: navItems
                .asMap()
                .entries
                .map((e) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          navItems[e.key]['icon'],
                          height: getScreenHeight(20),
                          width: getScreeWidth(20),
                          color: appCtrl.navBarIndex.value == e.key
                              ? kPrimary
                              : kAppIcon,
                        ),
                        getVerticalSpace(5),
                        Text(
                          navItems[e.key]['title'],
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: appCtrl.navBarIndex.value == e.key
                                ? kPrimary
                                : kAppIcon,
                          ),
                        ),
                      ],
                    ))
                .toList(),
          ),
        ),
      );
    });
  }


}
