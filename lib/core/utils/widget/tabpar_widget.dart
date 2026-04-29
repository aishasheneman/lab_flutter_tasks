import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/theme/app_colors.dart';
import '../../config/theme/app_txt_styles.dart';

class TabparWidget extends StatefulWidget {
  final List<String> tabs;
  final int initialIndex;
  final Function(int)? onChanged;

  const TabparWidget({
    super.key,
    required this.tabs,
    this.initialIndex = 0,
    this.onChanged,
  });

  @override
  State<TabparWidget> createState() => _TabparWidgetState();
}

class _TabparWidgetState extends State<TabparWidget> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20.w, left: 20.w),
      padding: EdgeInsets.all(2.w),
      height: 47.h,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(10.r),
      ),

      // 🔥 فقط أضفنا SingleChildScrollView
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(widget.tabs.length, (index) {
            final isSelected = selectedIndex == index;

            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  widget.onChanged?.call(index);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: EdgeInsets.symmetric(
                    vertical: 12.h,
                    horizontal: 25.w, // مهم عشان يصير قابل للتمرير بشكل جميل
                  ),
                  decoration: BoxDecoration(
                    color:
                        isSelected ? AppColors.primary : AppColors.shadowGrey,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      widget.tabs[index],
                      style: AppTextStyles.hinttext.copyWith(
                          color: isSelected
                              ? AppColors.white
                              : AppColors.darkFillColor,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
