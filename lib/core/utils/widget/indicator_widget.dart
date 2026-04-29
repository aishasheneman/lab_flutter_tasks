import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:bader_app_project/core/config/theme/app_colors.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({
    super.key,
    required this.count,
    required this.currentIndex,
    this.activeWidth = 18,
    this.inactiveWidth = 8,
    this.height = 8,
    this.spacing = 4,
  });

  final int count;
  final int currentIndex;
  final double activeWidth;
  final double inactiveWidth;
  final double height;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = currentIndex == index;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: spacing.w),
          width: isActive ? activeWidth.w : inactiveWidth.w,
          height: height.h,
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20.r),
          ),
        );
      }),
    );
  }
}
