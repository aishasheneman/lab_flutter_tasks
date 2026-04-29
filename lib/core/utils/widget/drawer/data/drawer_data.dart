import 'package:flutter/material.dart';
import '../model/drawer_modle.dart';

final List<DrawerModle> mainItems = [
  DrawerModle(icon: Icons.person, title: 'الملف الشخصي', page: 'ProfileScreen'),
  DrawerModle(icon: Icons.badge, title: 'دليل الفرق', page: 'TeamScreen'),
  DrawerModle(icon: Icons.group, title: 'دليل المتطوعين', page: 'volunteer'),
];

final List<DrawerModle> adminItems = [
  DrawerModle(icon: Icons.add, title: 'إنشاء منشور', page: 'volunteer'),
  DrawerModle(
      icon: Icons.event, title: 'إنشاء فرصة تطوعية', page: 'volunteerScreen'),
  DrawerModle(
      icon: Icons.chat_bubble_outline,
      title: 'نماذج واستبيانات',
      page: 'volunteer'),
  DrawerModle(
      icon: Icons.list_alt_rounded,
      title: 'طلبات إنشاء الفرص التطوعية',
      page: 'volunteer'),
  DrawerModle(
      icon: Icons.list_alt_rounded,
      title: 'طلبات منح النقاط',
      page: 'volunteer'),
  DrawerModle(icon: Icons.person_add, title: 'دعوة للعضوية', page: 'volunteer'),
];

final List<DrawerModle> settingsItems = [
  DrawerModle(icon: Icons.settings, title: 'الإعدادات', page: 'volunteer'),
  DrawerModle(icon: Icons.help, title: 'مساعدة', page: 'volunteer'),
];

final List<DrawerModle> dangerItems = [
  DrawerModle(
      icon: Icons.logout,
      title: 'تسجيل الخروج',
      color: Colors.red,
      page: 'volunteer'),
];
