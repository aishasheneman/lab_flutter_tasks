import 'package:bader_app_project/core/config/theme/app_colors.dart';
import 'package:bader_app_project/core/config/theme/app_txt_styles.dart';
import 'package:bader_app_project/core/utils/widget/container_widget.dart';
import 'package:bader_app_project/core/utils/widget/image_widget.dart';
import 'package:bader_app_project/core/utils/widget/primary_elevatedbutton.dart';
import 'package:bader_app_project/core/utils/widget/show_description.dart';
import 'package:bader_app_project/features/task/model/task_mudel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskWidget extends StatelessWidget {
  final TaskModel item;

  const TaskWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          ContainerWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageWidget(
                  postImage: item.image,
                  height: 180,
                  width: double.infinity,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 12.w, top: 9.h),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.primary,
                        radius: 5,
                      ),
                      SizedBox(width: 5.w),
                      Center(
                        child: Text(
                          item.userName,
                          style: AppTextStyles.hinttext.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(right: 12.w),
                  child: Text(item.title, style: AppTextStyles.heading),
                ),

                Padding(
                  padding: EdgeInsets.only(right: 15.w, top: 5.h),
                  child: ShowDescription(
                    text: item.description,
                    style: AppTextStyles.accuntStyle
                        .copyWith(color: AppColors.grey1),
                  ),
                ),

                // FOOTER
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.w,
                    right: 19.w,
                    // vertical: 15.w,
                  ),
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
                Divider(),
                PrimaryElevatedbutton(action: () {}, text: 'انضم الآن'),
              ],
            ),
          ),
          Positioned(
            top: 170.h,
            left: 40.w,
            child: Container(
              width: 60.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${item.points}",
                    style: AppTextStyles.smallButtonText,
                  ),
                  Text(
                    "نقطة",
                    style: AppTextStyles.subheading
                        .copyWith(color: AppColors.white),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 9.h,
            left: 80.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text("تقرير", style: AppTextStyles.smallButtonText),
            ),
          ),
        ],
      ),
    );
  }
}
