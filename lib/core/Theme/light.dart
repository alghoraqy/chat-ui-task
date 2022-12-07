import 'package:chat_ui/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

ThemeData lightTheme = ThemeData(
  fontFamily: 'Plus Jakarta Sans',
  primaryColor: AppColors.main,
  scaffoldBackgroundColor:AppColors.backGround,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.backGround,
    elevation: 0,
    systemOverlayStyle:const SystemUiOverlayStyle(
      statusBarColor:Colors.transparent
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )
    )
  )
);