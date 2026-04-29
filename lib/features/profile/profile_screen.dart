import 'package:bader_app_project/core/config/theme/app_colors.dart';
import 'package:bader_app_project/core/config/theme/app_txt_styles.dart';
import 'package:bader_app_project/core/utils/widget/app_bar_widget.dart';
import 'package:bader_app_project/features/post/presentation/widgets/post_widget.dart';
import 'package:bader_app_project/features/profile/data/profile_data.dart';
import 'package:bader_app_project/features/profile/data/profile_model.dart';
import 'package:bader_app_project/features/profile/presentation/profile_info_widget.dart';
import 'package:flutter/material.dart';
import '../task/data/task_data.dart';
import '../task/presentation/task_widget.dart';
import 'presentation/action_menu.dart';
import 'presentation/profile_header_widget.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key, required this.userId, this.isPrimary = true});
  final int userId;
  final bool isPrimary;
  final ProfileModel user = ProfileData.user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isPrimary
          ? AppBarWidget(pageName: "الملف الشخصي", icon: appBarIcon(context))
          : null,
      backgroundColor: const Color.fromARGB(255, 235, 231, 231),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            ProfileHeaderWidget(),
            Container(
              color: AppColors.white,
              child: TabBar(
                indicatorColor: AppColors.primary,
                tabs: [
                  Tab(
                      child: Text(
                    "معلومات الحساب",
                    style: AppTextStyles.smallButtonText
                        .copyWith(color: AppColors.primary),
                  )),
                  Tab(
                      child: Text(
                    "منشوراتي",
                    style: AppTextStyles.smallButtonText
                        .copyWith(color: AppColors.primary),
                  )),
                  Tab(
                      child: Text(
                    "الفرص التطوعية",
                    style: AppTextStyles.smallButtonText
                        .copyWith(color: AppColors.primary),
                  )),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(
                      child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProfileInfoWidget(
                          title: 'نبذة تعريفية',
                          icon: Icon(Icons.info_outline),
                          child: Column(
                            children: [
                              Text(
                                'إن الحمد لله نحمده ونستعينه ونستهديه ونعوذ بالله من شرور انفسنا وسيأت أعمالنا من يهده الله فلا مضل له ومن يضلل فلا هدي له وأشهد أن لا إلا اله وأن محمد عبده ورسوله صلى الله عليه وعى آله وصحبه وسلم',
                                style: AppTextStyles.subheading,
                              ),
                            ],
                          ),
                        ),
                        ProfileInfoWidget(
                          title: 'المعلومات الشخصية',
                          icon: Icon(Icons.folder_shared_outlined),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "العمر: ${user.age}",
                                style: AppTextStyles.subheading,
                              ),
                              Text("تاريخ الانضمام: ${user.joinDate}",
                                  style: AppTextStyles.subheading),
                              Text("الجنس: ${user.gender}",
                                  style: AppTextStyles.subheading),
                            ],
                          ),
                        ),
                        ProfileInfoWidget(
                          title: 'المهارات',
                          icon: Icon(Icons.workspace_premium),
                          child: Column(
                            children: [
                              Text(
                                "منتظرين الزبيدي",
                                style: AppTextStyles.subheading,
                              ),
                            ],
                          ),
                        ),
                        ProfileInfoWidget(
                            title: 'العضويات',
                            icon: Icon(Icons.groups),
                            child: Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: List.generate(10, (index) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    CircleAvatar(
                                      radius: 22,
                                      backgroundColor: Colors.blue.shade100,
                                      child: Text(
                                        String.fromCharCode(
                                            65 + index), // A B C D ...
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      "عضوية ${index + 1}",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ],
                                );
                              }),
                            )),
                        ProfileInfoWidget(
                          title: 'معلومات التواصل',
                          icon: Icon(Icons.people),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.local_phone_outlined),
                                  Text(
                                    "الهاتف: ${user.phone}",
                                    style: AppTextStyles.subheading,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.email_outlined),
                                  Text("البريد الالكتروني: ${user.email}",
                                      style: AppTextStyles.subheading),
                                ],
                              ),
                            ],
                          ),
                        ),
                        ProfileInfoWidget(
                          title: 'العنوان',
                          icon: Icon(Icons.location_on),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "المدينة: ${user.city}",
                                style: AppTextStyles.subheading,
                              ),
                              Text("المنطقة: ${user.area}",
                                  style: AppTextStyles.subheading),
                              Text("الشارع: ${user.street}",
                                  style: AppTextStyles.subheading),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
                  // Center(
                  //   child: ListView.builder(
                  //     itemCount: PostData.posts.length,
                  //     itemBuilder: (context, index) {
                  //       final item = PostData.posts[index];
                  //       return PostWidget(
                  //         item: item,
                  //       );
                  //     },
                  //   ),
                  // ),
                  Center(
                    child: ListView.builder(
                      itemCount: TaskData.items.length,
                      itemBuilder: (context, index) {
                        final item = TaskData.items[index];
                        return TaskWidget(
                          item: item,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconButton appBarIcon(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.more_vert),
      onPressed: () {
        // ActionMenu.show(
        //   context,
        //   onMutePoints: () {
        //     // logic
        //   },
        //   onBlock: () {
        //     // logic
        //   },
        // );
      },
    );
  }
}
