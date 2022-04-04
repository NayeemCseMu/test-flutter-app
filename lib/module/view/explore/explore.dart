import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:test_task/constants/app_color.dart';
import 'package:test_task/constants/app_size.dart';
import 'package:test_task/constants/app_text.dart';
import 'package:test_task/constants/assets_path.dart';
import 'package:test_task/module/controller/data_controller.dart';
import 'package:test_task/utils/helper/lazy_loader.dart';
import '../../../constants/app_constants.dart';

class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DataController data = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20.0),
      child: Column(
        children: [
          getVerticalSpace(10),
          SizedBox(
            height: getScreenHeight(45),
            child: TextField(
              decoration: buildInputDecoration,
            ),
          ),
          getVerticalSpace(25),
          const Divider(),
          getVerticalSpace(15),
          Expanded(
            child: Obx(
              () {
                return data.isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : StaggeredGridView.countBuilder(
                        crossAxisCount: 3,
                        itemCount: data.dataInfo.value.products!.length,
                        itemBuilder: (BuildContext context, int index) =>
                            GestureDetector(
                          onTap: () => showInfo,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
                              imageUrl: data
                                  .dataInfo.value.products![index].thumbnail!,
                              fit: BoxFit.cover,
                              fadeInCurve: Curves.ease,
                              progressIndicatorBuilder: (context, url, _) =>
                                  const ShimmerLoader(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            // Image.network(
                            //   data.dataInfo.value.products![index].thumbnail!,
                            //   fit: BoxFit.cover,
                            // ),
                          ),
                        ),
                        staggeredTileBuilder: (int index) => index % 7 == 0
                            ? const StaggeredTile.count(2, 2)
                            : const StaggeredTile.count(1, 1),
                        mainAxisSpacing: 6.0,
                        crossAxisSpacing: 6.0,
                      );
              },
            ),
          ),
        ],
      ),
    );
  }

  void get showInfo {
    Get.dialog(Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        // height: getScreenHeight(375),
        // width: getScreeWidth(265),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Image.asset(avatar),
                getHorizontalSpace(12),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: getTextSize(14),
                          color: kDark,
                        ),
                      ),
                      getVerticalSpace(5),
                      Text(
                        address,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: getTextSize(10),
                          color: kLightText,
                        ),
                      ),
                    ],
                  ),
                ),
                getHorizontalSpace(12),
                SizedBox(
                  height: getScreenHeight(32),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xffDEEBFF),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                    onPressed: () {},
                    child: Row(
                      children: [
                        SvgPicture.asset(addUserIcon),
                        getHorizontalSpace(5),
                        Text(
                          follow,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: getTextSize(12),
                            color: kPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            getVerticalSpace(16),
            Image.asset(
              preview,
              fit: BoxFit.cover,
            ),
            getVerticalSpace(16),
            SizedBox(
              height: getScreenHeight(45),
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: kBoxColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16))),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: getTextSize(14),
                      color: kDark,
                    ),
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
