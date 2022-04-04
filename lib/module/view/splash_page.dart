import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_task/config/route/app_route.dart';
import 'package:test_task/constants/app_size.dart';
import 'package:test_task/module/controller/data_controller.dart';

import '../../constants/app_color.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(3.seconds)
        .then((value) => Get.offAndToNamed(AppRoute.landingPage));
  }

  @override
  Widget build(BuildContext context) {
    DataController data = Get.find();
    return Scaffold(
      body: LayoutBuilder(
        builder: (context,constraints) {
          return OrientationBuilder(builder: (context, orientation) {
            ResponsiveSize.init(context, orientation);
            return SizedBox(
              height: constraints.maxHeight,
                width: constraints.maxWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Welcome",
                    style: GoogleFonts.lato(
                      fontSize: getTextSize(30),
                      fontWeight: FontWeight.w900,
                      color: kLightOrange,
                    ),
                  ),
                  getVerticalSpace(10),
                  Text(
                    "Explore Your Next Electronics Device",
                    style: GoogleFonts.lato(
                      fontSize: getTextSize(14),
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                      color: kLightText,
                    ),
                  )
                ],
              ),
            );
          });
        }
      ),
    );
  }
}
