import 'package:flutter/material.dart';

class ContactWidget extends StatelessWidget {
  const ContactWidget({super.key, required this.icon, required this.infoText});
  final IconData icon;
  final String infoText ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon),
            Text(infoText, style: TextStyle(fontSize: 19)),
          ],
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
