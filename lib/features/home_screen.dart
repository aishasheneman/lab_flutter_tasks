import 'package:bader_app_project/core/utils/functions/addpost.dart';
import 'package:bader_app_project/core/utils/functions/addreport.dart';
import 'package:bader_app_project/core/utils/widget/app_bar_widget.dart';
import 'package:bader_app_project/core/utils/widget/bottomnavigationbar_widget.dart';
import 'package:bader_app_project/core/utils/widget/drawer/drawer_widget.dart';
import 'package:bader_app_project/features/post/presentation/screens/post_screen.dart';
import 'package:bader_app_project/features/profile/profile_screen.dart';
import 'package:bader_app_project/features/task/task_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> get pages => [
        const PostScreen(),
        const TaskScreen(), // سيتم إعادة إنشائها عند كل مرة نختارها
        const PostScreen(
          invisibil: true,
        ),
        ProfileScreen(
          userId: 1,
          isPrimary: false,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      drawer: DrawerWidget(),
      body: pages[currentIndex],
      bottomNavigationBar: BottomnavigationbarWidget(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: Row(
        children: [
          FloatingActionButton(
            heroTag: "bt1",
            onPressed: () => showAddPostDialog(context),
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: "bt2",
            onPressed: () => showAddReportDialog(context),
            child: Icon(Icons.report),
          ),
        ],
      ),
    );
  }
}
