import 'package:bader_app_project/core/config/theme/app_colors.dart';
import 'package:bader_app_project/core/config/theme/app_txt_styles.dart';
import 'package:bader_app_project/core/utils/widget/container_widget.dart';
import 'package:bader_app_project/features/task/model/task_mudel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmergencyTaskWidget extends StatelessWidget {
  const EmergencyTaskWidget({super.key, required this.item});
  final TaskModel item;
  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
        child: Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.title,
                  style: AppTextStyles.heading.copyWith(fontSize: 23),
                ),
                Text(
                  '${item.points} نقطة',
                  style: AppTextStyles.heading
                      .copyWith(height: 0.5, color: AppColors.primary),
                )
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              children: [
                Expanded(
                  // مهم عشان يمنع التمدد الزائد
                  child: Text(
                    item.description,
                    maxLines: 1, // سطر واحد فقط
                    overflow: TextOverflow.ellipsis, // يحط "..." إذا النص طويل
                    style: AppTextStyles.subheading.copyWith(
                      color: AppColors.grey1,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 7.h, right: 5.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.access_time),
                      SizedBox(width: 4.h),
                      Text(item.time),
                      SizedBox(width: 7.h),
                      const Icon(Icons.people),
                      SizedBox(width: 4.h),
                      Text("${item.peopleCount}"),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.share_outlined),
                    onPressed: () async {
                      // File image = File('/path/to/image.jpg');
                      // await ShareService.shareImageTextWithLink(
                      //   imageFile: image,
                      //   text: "$widget.title /n $widget.description",
                      //   url: widget.postImage,
                      // );
                      // await ShareService.shareText(
                      //   "*${item.title}*:\n\n${item.description}",
                      // );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
