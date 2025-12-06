import 'package:end_project/pages/splashpage.dart';
import 'package:flutter/material.dart';



void main() {
   

  runApp(MountainTripApp());
}

class MountainTripApp extends StatefulWidget {
  const MountainTripApp({super.key});

  @override
  State<MountainTripApp> createState() => _MountainTripAppState();
}

class _MountainTripAppState extends State<MountainTripApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Splashpage(),
    );
  }
}