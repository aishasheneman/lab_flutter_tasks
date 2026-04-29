import 'package:bader_app_project/core/config/theme/app_txt_styles.dart';
import 'package:bader_app_project/core/utils/widget/container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileInfoWidget extends StatelessWidget {
  final String title;
  final Icon icon;
  final Widget child;
  const ProfileInfoWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      child: Padding(
        padding: EdgeInsets.only(bottom: 5.h, right: 5.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                icon,
                SizedBox(
                  width: 3.w,
                ),
                Text(title, style: AppTextStyles.heading),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.penToSquare,
                    size: 20,
                  ),
                )
              ],
            ),
            Divider(),
            const SizedBox(height: 10),
            child,
          ],
        ),
      ),
    );
  }
}
