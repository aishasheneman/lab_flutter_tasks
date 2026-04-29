import 'package:bader_app_project/core/config/theme/app_colors.dart';
import 'package:bader_app_project/core/config/theme/app_fonts.dart';
import 'package:bader_app_project/core/config/theme/app_txt_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData getLightTheme() {
  return ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    fontFamily: AppFonts.lateef,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    ),

    //Text Theme
    textTheme: ThemeData.light().textTheme.apply(
          bodyColor: AppColors.grey3,
          displayColor: AppColors.grey3,
        ),

    //AppBar Theme
    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AppColors.secondary,
      titleTextStyle: AppTextStyles.title,
    ),

    //Dialog Theme
    dialogTheme: DialogThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
    ),

    //BottomNavigationBar Theme
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 3,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.grey0,
    ),

    //FloatingActionButton Theme
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
    ),

    //SnackBar Theme
    snackBarTheme: SnackBarThemeData(behavior: SnackBarBehavior.floating),

    //Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        maximumSize: Size(310.w, 45.h),
        minimumSize: Size(100.w, 15.h),
        disabledBackgroundColor: AppColors.grey0,
        disabledForegroundColor: AppColors.white,
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
        borderSide: const BorderSide(color: AppColors.borderGrey),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(color: AppColors.borderGrey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.r),
        borderSide: const BorderSide(color: AppColors.primary),
      ),
      hintStyle: AppTextStyles.hinttext,
    ),
  );
}
