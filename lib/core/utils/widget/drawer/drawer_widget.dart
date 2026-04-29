import 'package:bader_app_project/core/config/theme/app_colors.dart';
import 'package:bader_app_project/core/config/theme/app_txt_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'data/drawer_data.dart';
import 'model/drawer_modle.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white, // ✔️ حل الشفافية
      child: Column(
        children: [
          // 🔼 المحتوى الأساسي
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 40.h),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 30.r,
                        backgroundColor: AppColors.primary,
                        child: const Icon(Icons.person, color: Colors.white),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: Text(
                          'user name',
                          style: AppTextStyles.heading,
                        ),
                      ),
                      const Icon(Icons.arrow_drop_down),
                    ],
                  ),
                ),
                section('الإجراءات الأساسية', mainItems),
                section('الإدارة', adminItems),
                section('الإعدادات', settingsItems),
                section('', dangerItems),
              ],
            ),
          ),

          // 🔻 الفوتر
          Padding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('من نحن', style: AppTextStyles.captiontext),
                    SizedBox(width: 15.w),
                    Text('تواصل معنا', style: AppTextStyles.captiontext),
                    SizedBox(width: 15.w),
                    Text('عن المطور', style: AppTextStyles.captiontext),
                  ],
                ),
                SizedBox(height: 10.h),
                Text(
                  '© 2026 منصة بادر - جميع الحقوق محفوظة',
                  style: AppTextStyles.captiontext.copyWith(fontSize: 12.sp),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'الشروط والأحكام',
                      style: AppTextStyles.captiontext.copyWith(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Text(
                      'سياسة الخصوصية',
                      style: AppTextStyles.captiontext.copyWith(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget section(String title, List<DrawerModle> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty)
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 10.h,
            ),
            child: Text(title, style: AppTextStyles.captiontext),
          ),
        ListView.builder(
          itemCount: items.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final item = items[index];

            return ListTile(
              leading: Icon(item.icon, color: item.color ?? AppColors.primary),
              title: Text(
                item.title,
                style: AppTextStyles.bodyStyle.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {},
            );
          },
        ),
      ],
    );
  }
}
