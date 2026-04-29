import 'package:bader_app_project/core/config/theme/app_colors.dart';
import 'package:bader_app_project/core/config/theme/app_txt_styles.dart';
import 'package:bader_app_project/features/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccuntWidget extends StatelessWidget {
  const AccuntWidget({
    super.key,
    required this.userName,
    required this.id,
    this.subInfo,
    this.userImage,
    this.isPrimary = false,
    this.size = 27,
  });

  final String userName;
  final String? subInfo;
  final String? userImage;
  final bool isPrimary;
  final int size;
  final int id;

  @override
  Widget build(BuildContext context) {
    return isPrimary ? primaryShow(context) : defulteShow(context);
  }

  Widget primaryShow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(userId: id),
                ),
              );
            },
            child: CircleAvatar(
              radius: size.r,
              backgroundImage:
                  userImage != null ? AssetImage(userImage!) : null,
              backgroundColor: AppColors.primary,
              child: userImage == null
                  ? const Icon(Icons.person, color: AppColors.white)
                  : Image.network(userImage!),
            ),
          ),
          SizedBox(height: 9.h),
          Text(userName, style: AppTextStyles.accuntStyle),
        ],
      ),
    );
  }

  Widget defulteShow(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(userId: id),
              ),
            );
          },
          child: CircleAvatar(
            radius: size.r,
            backgroundImage: userImage != null ? AssetImage(userImage!) : null,
            backgroundColor: AppColors.primary,
            child: userImage == null
                ? const Icon(Icons.person, color: AppColors.white)
                : null,
          ),
        ),
        SizedBox(width: 8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              userName,
              style: AppTextStyles.smallButtonText.copyWith(
                color: AppColors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
            if (subInfo != null && subInfo!.trim().isNotEmpty)
              Text(subInfo!, style: AppTextStyles.hinttext),
          ],
        ),
      ],
    );
  }
}
