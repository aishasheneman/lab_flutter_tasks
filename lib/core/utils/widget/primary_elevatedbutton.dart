import 'package:bader_app_project/core/config/theme/app_colors.dart';
import 'package:bader_app_project/core/config/theme/app_txt_styles.dart';
import 'package:flutter/material.dart';

class PrimaryElevatedbutton extends StatelessWidget {
  const PrimaryElevatedbutton({
    super.key,
    required this.action,
    required this.text,
    this.isPrimaryColor = true,
    this.buttonTextStyle,
  });

  final VoidCallback? action;
  final String text;
  final bool isPrimaryColor;
  final TextStyle? buttonTextStyle;

  @override
  Widget build(BuildContext context) {
    final Color color = isPrimaryColor ? AppColors.primary : AppColors.error;

    return ElevatedButton(
      onPressed: action,
      style: ElevatedButton.styleFrom(backgroundColor: color),
      child: Center(
        child: Text(
          text,
          style:
              buttonTextStyle ?? AppTextStyles.largeButtonText, // 👈 fallback
        ),
      ),
    );
  }
}
