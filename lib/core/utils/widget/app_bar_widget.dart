import 'package:bader_app_project/core/config/theme/app_txt_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    this.pageName = '',
    this.icon,
  });
  final String pageName;
  final Widget? icon;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return pageName.isEmpty ? primaryShow(context) : secondryShow(context);
  }

  AppBar primaryShow(BuildContext context) {
    return AppBar(
      // leading: IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
      centerTitle: true,
      title: SizedBox(
          height: 35.h,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // CustemDrwer(),
              Expanded(
                child: TextField(
                  textAlign: TextAlign.right,
                  decoration: InputDecoration(
                    hintText: "ابحث عن مستخدم...",
                    hintStyle: AppTextStyles.hinttext.copyWith(
                      fontSize: 14.sp.clamp(14, 14),
                    ),
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                  ),
                ),
              ),
            ],
          )),
      actions: [
        Row(
          children: [
            // Icon(Icons.notifications_none),
            Icon(Icons.notifications_none),
            SizedBox(width: 3.w),
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/bader_logo.png"),
              backgroundColor: Colors.transparent,
            ),
            SizedBox(
              width: 7.w,
            )
          ],
        )
      ],
    );
  }

  AppBar secondryShow(BuildContext context) {
    return AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: Text(pageName),
        actions: [icon!]);
  }
}
