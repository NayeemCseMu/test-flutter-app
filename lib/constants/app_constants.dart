import 'package:flutter/material.dart';
import 'package:test_task/constants/assets_path.dart';

import 'app_color.dart';

List<Map<String,dynamic>> navItems = [
  {
    "title": "Home",
    "icon": homeIcon,
  }, {
    "title": "Explore",
    "icon": exploreIcon,
  }, {
    "title": "Inbox",
    "icon": inboxIcon,
  }, {
    "title": "Shop",
    "icon": cartIcon,
  },
];

OutlineInputBorder get buildOutlineInputBorder {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: kBoxColor,
        width: 1,
      ));
}