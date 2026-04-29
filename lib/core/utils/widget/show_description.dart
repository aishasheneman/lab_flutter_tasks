import 'package:bader_app_project/core/config/theme/app_txt_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowDescription extends StatefulWidget {
  const ShowDescription({
    super.key,
    required this.text,
    this.maxLines = 2,
    this.style,
  });

  final String text;
  final int maxLines;
  final TextStyle? style;

  @override
  State<ShowDescription> createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ShowDescription> {
  bool isExpanded = false;
  bool isOverflowing = false;

  @override
  void initState() {
    super.initState();
    // سيتم تحديد لاحقًا إذا النص طويل
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final span = TextSpan(text: widget.text, style: widget.style);

        final tp = TextPainter(
          text: span,
          maxLines: widget.maxLines,
          textDirection: TextDirection.ltr,
        );

        tp.layout(maxWidth: constraints.maxWidth);

        isOverflowing = tp.didExceedMaxLines;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 5.h),
              child: Text(
                widget.text,
                maxLines: isExpanded ? null : widget.maxLines,
                overflow:
                    isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                style: widget.style,
              ),
            ),
            if (isOverflowing)
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(bottom: 0.h, left: 9.w),
                  child: Align(
                    alignment: AlignmentGeometry.topLeft,
                    child: Text(
                      isExpanded ? "عرض أقل" : "عرض المزيد",
                      style: AppTextStyles.link,
                    ),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
