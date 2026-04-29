import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/theme/app_colors.dart';
import '../../config/theme/app_txt_styles.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 20.r,
          backgroundColor: AppColors.white,
          child: Image.asset('assets/images/union_logo.PNG'),
        ),
        SizedBox(width: 5.w),
        Text(
          'تابع لاتحاد الملتقيات الشبابية التطوعية',
          style: AppTextStyles.captiontext.copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
