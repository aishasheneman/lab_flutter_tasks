import 'package:bader_app_project/core/config/theme/app_colors.dart';
import 'package:bader_app_project/core/config/theme/app_txt_styles.dart';
import 'package:flutter/material.dart';

class BottomnavigationbarWidget extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomnavigationbarWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      // type: BottomNavigationBarType,
      elevation: 10,
      backgroundColor: AppColors.white,
      selectedItemColor: AppColors.primary,
      unselectedLabelStyle: AppTextStyles.smallButtonText,
      selectedLabelStyle: AppTextStyles.smallButtonText,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          activeIcon: Icon(Icons.home),
          label: 'الرئيسية',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.volunteer_activism_outlined),
          activeIcon: Icon(Icons.volunteer_activism),
          label: 'الفرص التطوعية',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.campaign_outlined),
          activeIcon: Icon(Icons.campaign),
          label: 'أخبار الاتحاد',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          activeIcon: Icon(Icons.person),
          label: 'الملف الشخصي',
        ),
      ],
    ); // ✔️ هنا المهمة
  }
}
