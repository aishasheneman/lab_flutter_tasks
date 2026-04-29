import 'package:bader_app_project/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.child,
    this.bottom = 9,
    this.top = 9,
  });
  final double bottom;
  final double top;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: top.h,
        bottom: bottom.h,
        left: 13.w,
        right: 13.w,
      ),
      padding: EdgeInsets.only(top: 10.h, bottom: 10.h, left: 7.w, right: 7.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowGrey,
            blurRadius: 10.r,
            spreadRadius: 2.r,
            offset: Offset(0, 4.dg),
          ),
        ],
      ),
      child: child, // 👈 أهم نقطة
    );
  }
}
