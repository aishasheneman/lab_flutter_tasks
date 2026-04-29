import 'package:bader_app_project/core/config/theme/app_colors.dart';
import 'package:bader_app_project/core/config/theme/app_txt_styles.dart';
import 'package:bader_app_project/core/utils/widget/indicator_widget.dart';
import 'package:bader_app_project/core/utils/widget/tabpar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'data/task_data.dart';
import 'presentation/emergency_task_widget.dart';
import 'presentation/task_widget.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = ["ميدانية", "عن بعد"];
    int currentIndex = 0;
    final List<String> categories =
        TaskData.items.map((item) => item.category).toSet().toList();

    final Function(String) onSelected;
    void _showSortOptions(BuildContext context) {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: SizedBox(
              height: 130.h,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text("الأعلى نقاط"),
                    onTap: () {},
                  ),
                  Divider(
                    endIndent: 10,
                    indent: 10,
                  ),
                  ListTile(
                    title: const Text("الأقل نقاط"),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
        body: Column(
      children: [
        TabparWidget(tabs: tabs),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: AppColors.error,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    'مهام عاجلة',
                    style: AppTextStyles.subheading.copyWith(
                        color: AppColors.error, fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              IndicatorWidget(
                count: TaskData.items.length,
                currentIndex: currentIndex,
                spacing: 0.9,
                activeWidth: 9,
                inactiveWidth: 5,
                height: 4,
              )
            ],
          ),
        ),
        SizedBox(
          height: 155.h,
          width: double.infinity, // مهم تحدد ارتفاع
          child: PageView.builder(
            itemCount: TaskData.items.length,
            controller: PageController(viewportFraction: 0.99),
            onPageChanged: (index) {
              setState() {
                currentIndex = index;
              }
            },
            itemBuilder: (context, index) {
              final item = TaskData.items[index];
              return EmergencyTaskWidget(item: item);
            },
          ),
        ),
        Row(
          children: [
            TextButton.icon(
                onPressed: () => _showSortOptions(context),
                icon: const Icon(Icons.swap_vert),
                label: const Text("ترتيب حسب")),
          ],
        ),
        TabparWidget(tabs: categories),
        Expanded(
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
    ));
  }
}
