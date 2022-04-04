import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:test_task/constants/assets_path.dart';

import 'app_color.dart';
import 'app_size.dart';
import 'app_text.dart';

List<Map<String, dynamic>> navItems = [
  {
    "title": "Home",
    "icon": homeIcon,
  },
  {
    "title": "Explore",
    "icon": exploreIcon,
  },
  {
    "title": "",
    "icon": addIcon,
  },
  {
    "title": "Inbox",
    "icon": inboxIcon,
  },
  {
    "title": "Shop",
    "icon": cartIcon,
  },
];

InputDecoration get buildInputDecoration {
  return InputDecoration(
      fillColor: kBoxColor,
      filled: true,
      border: buildOutlineInputBorder,
      enabledBorder: buildOutlineInputBorder,
      focusedBorder: buildOutlineInputBorder,
      contentPadding: EdgeInsets.zero,
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
      ));
}

OutlineInputBorder get buildOutlineInputBorder {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: kBoxColor,
        width: 1,
      ));
}
