import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/config/theme/app_colors.dart';
import '../../../core/config/theme/app_txt_styles.dart';
import '../../../core/utils/widget/image_widget.dart';
import '../onboarding_model.dart';

class OnboardingCardWidget extends StatelessWidget {
  final OnboardingModel item;

  const OnboardingCardWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: ImageWidget(postImage: item.image, height: 200),
            ),
            SizedBox(height: 15.h),
            _buildTitle(),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Text(
                item.description,
                textAlign: TextAlign.center,
                style: AppTextStyles.subheading,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text.rich(
      TextSpan(
        style: AppTextStyles.title,
        children: [
          TextSpan(text: item.titleNormal),
          if (item.titleHighlight.isNotEmpty)
            TextSpan(
              text: item.titleHighlight,
              style: AppTextStyles.title.copyWith(
                fontSize: 50.sp,
                color: AppColors.primary,
                fontWeight: FontWeight.w900,
              ),
            ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
