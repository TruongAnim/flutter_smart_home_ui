import 'package:flutter/material.dart';
import 'package:smart_home_ui/app_assets/app_colors.dart';

class AppStyles {
  static const TextStyle welcome =
      TextStyle(color: AppColors.darkText, fontSize: 24);
  static const TextStyle name = TextStyle(
      color: AppColors.darkText, fontSize: 34, fontWeight: FontWeight.bold);
  static const TextStyle devices = TextStyle(
      color: AppColors.darkText, fontSize: 20, fontWeight: FontWeight.bold);
  static const TextStyle activeDevice = TextStyle(
      color: AppColors.lightText, fontSize: 24, fontWeight: FontWeight.bold);
}
