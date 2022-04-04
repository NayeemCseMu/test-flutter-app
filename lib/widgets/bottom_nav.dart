import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../constants/app_color.dart';
import '../constants/app_constants.dart';
import '../constants/app_size.dart';
import '../module/controller/app_controller.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppController appCtrl = Get.find();
    return Container(
      height: getScreenHeight(90),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            blurRadius: 15,
            color: Colors.black.withOpacity(0.03),
          )
        ],
      ),
      child: Obx(() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: navItems.asMap().entries.map((e) {
            if (e.key == 2) {
              return GestureDetector(
                onTap: () {
                  appCtrl.changeNavItem(e.key);
                },
                child: CircleAvatar(
                  backgroundColor: kDark,
                  radius: 30,
                  child: SvgPicture.asset(navItems[e.key]['icon']),
                ),
              );
            } else {
              return GestureDetector(
                onTap: () {
                  appCtrl.changeNavItem(e.key);
                },
                child: Column(
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
                        fontSize: getTextSize(12),
                        fontWeight: FontWeight.w500,
                        color: appCtrl.navBarIndex.value == e.key
                            ? kPrimary
                            : kAppIcon,
                      ),
                    ),
                  ],
                ),
              );
            }
          }).toList(),
        );
      }),
    );
  }
}
