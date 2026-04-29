import 'package:bader_app_project/core/config/theme/app_txt_styles.dart';
import 'package:flutter/material.dart';

class DrawerItemsWidget extends StatelessWidget {
  const DrawerItemsWidget({
    super.key,
    required this.icons,
    required this.text,
    required this.page,
  });
  final Icon icons;
  final String text;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: icons,
        title: Text(text, style: AppTextStyles.captiontext),
        trailing: Icon(Icons.arrow_forward_ios),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
      ),
    );
  }
}
