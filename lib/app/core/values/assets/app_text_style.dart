import 'package:flutter/material.dart';
import 'package:onboard_coolva/app/core/theme/app_color.dart';

class AppTextStyle {
  AppTextStyle._();

  static const String _fontFamily = 'PlusJakartaSans';

  static const FontWeight _regular = FontWeight.w400;
  static const FontWeight _medium = FontWeight.w500;
  static const FontWeight _semiBold = FontWeight.w600;

  static const TextStyle appBar = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: _semiBold,
    fontSize: 20,
    color: AppColor.neutral700,

  );
  
  static const TextStyle heading1 = TextStyle(
    fontFamily: _fontFamily,
    fontWeight: _semiBold,
    fontSize: 16,
    color: AppColor.neutral700,
  );
}