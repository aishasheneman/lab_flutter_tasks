import 'package:bader_app_project/core/config/theme/app_colors.dart';
import 'package:bader_app_project/core/config/theme/app_fonts.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextStyles {
  const AppTextStyles._();

  static TextStyle title = TextStyle(
    fontSize: 28.sp.clamp(28, 28),
    fontFamily: AppFonts.lateef,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
    //letterSpacing: 0,
    // height: 42,
  );

  static TextStyle heading = TextStyle(
    fontSize: 20.sp.clamp(20, 20),
    fontFamily: AppFonts.lateef,
    fontWeight: FontWeight.bold,
    color: AppColors.grey2,
    // height: 30,
  );

  static TextStyle subheading = TextStyle(
    fontSize: 18.sp.clamp(18, 18),
    fontFamily: AppFonts.lateef,
    fontWeight: FontWeight.normal,
    color: AppColors.grey0,
    letterSpacing: 0,
    // height: 28,
  );

  static TextStyle bodyStyle = TextStyle(
    fontSize: 14.sp.clamp(14, 14),
    fontFamily: AppFonts.lateef,
    fontWeight: FontWeight.normal,
    color: AppColors.grey3,
    // height: 22,
  );

  static TextStyle accuntStyle = TextStyle(
    fontSize: 15.sp.clamp(15, 15),
    fontFamily: AppFonts.lateef,
    fontWeight: FontWeight.w600,
    color: AppColors.grey3,

    // height: 22,
  );

  static TextStyle link = TextStyle(
    fontSize: 14.sp.clamp(14, 14),
    fontFamily: AppFonts.lateef,
    fontWeight: FontWeight.bold,
    color: AppColors.info,
    // height: 18,
  );

  static TextStyle captiontext = TextStyle(
    fontSize: 12.sp.clamp(12, 12),
    fontFamily: AppFonts.lateef,
    fontWeight: FontWeight.normal,
    color: AppColors.grey1,
    // height: 22,
  );

  static TextStyle hinttext = TextStyle(
    fontSize: 16.sp.clamp(16, 16),
    fontFamily: AppFonts.lateef,
    fontWeight: FontWeight.normal,
    color: AppColors.grey1,
  );

  //buttons style
  static TextStyle smallButtonText = TextStyle(
    fontSize: 18.sp.clamp(18, 18),
    fontFamily: AppFonts.lateef,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
    // height: 1.4,
  );

  static TextStyle largeButtonText = TextStyle(
    fontSize: 20.sp.clamp(20, 20),
    fontFamily: AppFonts.lateef,
    fontWeight: FontWeight.normal,
    color: AppColors.white,
    // height: 1.4,
  );
}
