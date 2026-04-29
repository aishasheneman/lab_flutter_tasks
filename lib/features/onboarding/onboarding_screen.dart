import 'package:bader_app_project/core/utils/widget/indicator_widget.dart';
import 'package:bader_app_project/features/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../core/utils/widget/logo_widget.dart';
import '../../core/utils/widget/primary_elevatedbutton.dart';
import '../../core/utils/widget/secondary_elevatedbutton.dart';
import 'onboarding_data.dart';
import 'onboarding_model.dart';
import 'presentation/onboarding_card_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int currentPage = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<OnboardingModel> pages = OnboardingData.imbourds;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              itemCount: pages.length,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                return OnboardingCardWidget(item: pages[index]);
              },
            ),
          ),
          IndicatorWidget(
            count: pages.length,
            currentIndex: currentPage,
          ),

          SizedBox(height: 20.h),

          // 🔥 الأزرار
          if (currentPage == pages.length - 1)
            // ⭐ آخر صفحة
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: SecondaryElevatedbutton(
                    action: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    text: 'التسجيل بإستخدام قوقل',
                    icon: FaIcon(FontAwesomeIcons.google),
                  ),
                ),
                SizedBox(height: 10.h),
                SecondaryElevatedbutton(
                  action: () {
                    // زر تسجيل الدخول أو رجوع
                  },
                  text: 'التسجيل بإستخدام فيسبوك',
                  icon: FaIcon(FontAwesomeIcons.facebook),
                ),
              ],
            )
          else
            // 🔵 باقي الصفحات
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: PrimaryElevatedbutton(
                    action: () {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    text: 'التالي',
                  ),
                ),
                SizedBox(height: 10.h),
                SecondaryElevatedbutton(
                  action: () {
                    controller.animateToPage(
                      pages.length - 1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  text: 'تخطي',
                ),
              ],
            ),

          SizedBox(height: 15.h),

          // 🔻 اللوجو
          LogoWidget(),

          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
