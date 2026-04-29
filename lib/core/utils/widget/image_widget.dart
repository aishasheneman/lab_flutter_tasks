import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.postImage,
    this.height = 150,
    this.width,
  });

  final String? postImage;
  final double height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    if (postImage == null || postImage!.isEmpty) {
      return const SizedBox.shrink();
    }

    return SizedBox(
      height: height.h,
      width: width?.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Image.asset(
          postImage!,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
