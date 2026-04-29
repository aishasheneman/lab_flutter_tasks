import 'package:flutter/material.dart';

class DrawerModle {
  final IconData icon;
  final String title;
  final String page;
  final Color? color;

  DrawerModle(
      {required this.icon,
      required this.title,
      this.color,
      required this.page});
}
