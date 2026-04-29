import 'package:bader_app_project/core/config/theme/app_colors.dart';
import 'package:bader_app_project/core/config/theme/app_txt_styles.dart';
import 'package:bader_app_project/core/utils/widget/accunt_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.only(top: 30),
            padding: const EdgeInsets.only(top: 120),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.w),
                      // height: 30.h,
                      // width: 60.w,
                      decoration: BoxDecoration(
                        color: AppColors.container,
                        borderRadius: BorderRadius.all(Radius.circular(20.r)),
                      ),
                      child: Text(
                        'فئة الريادة',
                        style: AppTextStyles.accuntStyle,
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.w),
                      // height: 30.h,
                      // width: 60.w,
                      decoration: BoxDecoration(
                        color: AppColors.container,
                        borderRadius: BorderRadius.all(Radius.circular(20.r)),
                      ),
                      child: Text(
                        'متطوع',
                        style: AppTextStyles.accuntStyle,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    '  نقطة 345',
                    style: AppTextStyles.smallButtonText
                        .copyWith(color: AppColors.black),
                  ),
                )
              ],
            )),
        Positioned(
          child: Center(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    AccuntWidget(
                      userImage: "assets/images/bader_logo.png",
                      userName: 'salem alhdad',
                      isPrimary: true,
                      size: 40,
                      id: 1,
                    ),
                    // R
                    Positioned(
                      bottom: 65,
                      right: 20,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.r)),
                          border:
                              Border.all(color: AppColors.white, width: 1.3),
                        ),
                        child: CircleAvatar(
                          backgroundColor: AppColors.primary,
                          radius: 17.r,
                          child: FaIcon(
                            FontAwesomeIcons.penToSquare,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        )
      ],
    );
  }
}
