import 'package:bader_app_project/core/config/theme/app_colors.dart';
import 'package:bader_app_project/core/config/theme/app_txt_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondaryElevatedbutton extends StatelessWidget {
  const SecondaryElevatedbutton({
    super.key,
    required this.action,
    required this.text,
    this.isPrimaryColor = true,
    this.icon,
  });
  final VoidCallback? action;
  final String text;
  final bool isPrimaryColor;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    final Color color = isPrimaryColor ? AppColors.primary : AppColors.error;
    return ElevatedButton(
      onPressed: action,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        foregroundColor: color,
        textStyle: AppTextStyles.largeButtonText.copyWith(color: color),
        side: BorderSide(color: color),
      ),
      child: Center(
        child: icon != null
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(text),
                  SizedBox(width: 5.w),
                  icon!,
                ],
              )
            : Text(text),
      ),
    );
  }
}
