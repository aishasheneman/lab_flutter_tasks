import 'package:bader_app_project/core/utils/widget/image_widget.dart';
import 'package:flutter/widgets.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const ImageWidget(
              height: 300, postImage: 'assets/images/bader_logo.png')
        ],
      ),
    );
  }
}
