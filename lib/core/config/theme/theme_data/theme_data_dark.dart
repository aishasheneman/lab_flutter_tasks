import 'package:bader_app_project/core/config/theme/app_colors.dart';
import 'package:bader_app_project/core/config/theme/app_fonts.dart';
import 'package:bader_app_project/core/config/theme/app_txt_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.black,
    fontFamily: AppFonts.lateef,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryDark,
      brightness: Brightness.dark,
    ),

    //Text Theme
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: AppColors.white,
          displayColor: AppColors.white,
        ),

    //Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryDark,
        foregroundColor: AppColors.white,
        disabledBackgroundColor: AppColors.grey3,
        disabledForegroundColor: AppColors.grey0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        textStyle: AppTextStyles.smallButtonText,
      ),
    ),

    //Icon Theme
    iconTheme: IconThemeData(size: 20.sp, color: AppColors.grey0),

    //TextField Theme
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(color: AppColors.grey1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(color: AppColors.grey1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(color: AppColors.primaryDark),
      ),
      fillColor: AppColors.darkFillColor,
      filled: true,
      hintStyle: AppTextStyles.hinttext,
    ),
  );
}
