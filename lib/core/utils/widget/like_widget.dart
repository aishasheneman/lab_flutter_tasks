import 'package:bader_app_project/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LikeWidget extends StatefulWidget {
  const LikeWidget({super.key, required this.likes, this.iLike = false});
  final int likes;
  final bool iLike;
  @override
  State<LikeWidget> createState() => _LikeWidgetState();
}

class _LikeWidgetState extends State<LikeWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: widget.iLike
              ? Icon(Icons.favorite, color: AppColors.error)
              : Icon(Icons.favorite_border),
          onPressed: () {
            setState(() {});
          },
        ),
        Text(widget.likes.toString()),
      ],
    );
  }
}
