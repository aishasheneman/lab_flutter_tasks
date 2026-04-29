import 'package:bader_app_project/app/app.dart';
import 'package:bader_app_project/core/config/theme/theme_data/theme_controller.dart';
import 'package:bader_app_project/core/network/supabase_client.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: SupaConfig.supabaseUrl, anonKey: SupaConfig.supabaseAnonKey);
  await ThemeController.loadTheme();
  runApp( BaderApp());
}

