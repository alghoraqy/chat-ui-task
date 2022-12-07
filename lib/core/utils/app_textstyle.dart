import 'package:chat_ui/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextStyle {
 static TextStyle title = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w700,
  color: AppColors.primaryText
 );

 static TextStyle userName = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w800,
  color: AppColors.primaryText
 );
  static TextStyle messageBody = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: AppColors.secondaryText
 );

  static TextStyle hintStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: AppColors.primaryText.withOpacity(.5)
 );

   static TextStyle groupMessage = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w400,
  color: AppColors.primaryText
 );
}