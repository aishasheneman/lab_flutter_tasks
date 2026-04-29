import 'package:bader_app_project/core/config/theme/app_colors.dart';
import 'package:bader_app_project/core/config/theme/app_txt_styles.dart';
import 'package:bader_app_project/core/utils/functions/formatSmartDate.dart';
import 'package:bader_app_project/core/utils/widget/accunt_widget.dart';
import 'package:bader_app_project/core/utils/widget/container_widget.dart';
import 'package:bader_app_project/core/utils/widget/image_widget.dart';
import 'package:bader_app_project/core/utils/widget/like_widget.dart';
import 'package:bader_app_project/core/utils/widget/show_description.dart';
import 'package:bader_app_project/features/post/domain/entities/post_entity.dart';
import 'package:bader_app_project/features/post/presentation/state_management/post_proveder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key, required this.item});

  final PostEntity item;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          ContainerWidget(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        // Navigator.push(context, PageRoute.);
                      },
                      child: AccuntWidget(
                        userName: item.publisherName?? 'لا يوجد اسم',
                        subInfo: item.createdAt != null ? formatSmartDate(item.createdAt!) : "الآن",
                        userImage: item.publisherImage,
                        id: 1,
                      ),
                    ),
                    PopupMenuButton<String>(
                      onSelected: (value) {
                        if (value == 'delete') {
                          // حط هنا كود الحذف
                          showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("حذف المنشور"),
        content: const Text("هل أنت متأكد من رغبتك في حذف هذا المنشور؟"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("إلغاء"),
          ),
          TextButton(
            onPressed: () {
              // استدعاء دالة الحذف باستخدام id المنشور
              context.read<PostProvider>().deleteExistingPost(item.id??'');
              Navigator.pop(context);
            },
            child: const Text("حذف", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
                        }
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 'delete',
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete,
                                color: AppColors.error,
                                size: 17.sp,
                              ),
                              Text('حذف', style: AppTextStyles.hinttext),
                            ],
                          ),
                        ),
                      ],
                      icon: const Icon(Icons.more_vert),
                    ),
                  ],
                ),

                Padding(
                  padding: EdgeInsets.only(top: 8.h, bottom: 8.h),
                  child: Text(item.title , style: AppTextStyles.heading),
                ),

                ShowDescription(
                  text: item.content,
                  style: AppTextStyles.accuntStyle
                      .copyWith(color: AppColors.grey1),
                ),

                ImageWidget(
                  postImage: item.imageUrl,
                  width: double.infinity,
                ),

                const Divider(),

                /// Actions
                Padding(
                  padding: EdgeInsets.only(right: 8.w, left: 25.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LikeWidget(
                        likes: item.likesCount ??0,
                       // iLike: item.iLike,
                      ),
                      IconButton(
                        icon: Icon(Icons.share_outlined),
                        onPressed: () {
                          // File image = File('/path/to/image.jpg');
                          // await ShareService.shareImageTextWithLink(
                          //   imageFile: image,
                          //   text: "$widget.title /n $widget.description",
                          //   url: widget.postImage,
                          // );
                          // await ShareService.shareText(
                          //   "*${widget.title}*:\n\n${widget.description}",
                          //   );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 2.h,
            left: 50.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 5.w),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                item.type == "post" ? "منشور" : "تقرير",
                style: AppTextStyles.smallButtonText,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
