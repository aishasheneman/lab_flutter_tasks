import 'package:flutter/material.dart';
import 'package:lab_task_5/models/listtilemod.dart';
import 'package:lab_task_5/widgets/listtile.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});
  final List<ListTileMod> tasks =const [
    ListTileMod(cardColor: Colors.white70, task: "Flutter Lab task_3", finishDate: "27/11/2025"),
    ListTileMod(cardColor: Color.fromARGB(255, 247, 234, 120), task: "Flutter Lab task_4", finishDate: "27/11/2025"),
    ListTileMod(cardColor: Color.fromARGB(179, 128, 248, 112), task: "Flutter Lab task_5", finishDate: "2/12/2025"),
    ListTileMod(cardColor: Color.fromARGB(179, 169, 208, 245), task: "Flutter End project", finishDate: "7/12/2025"),
    ListTileMod(cardColor: Colors.white70, task: "Flutter End exam", finishDate: "7/12/2025"),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: EdgeInsets.all(10),
    child: ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context ,i){
        return ListTileWidget(items: tasks[i]);
    }),
    );
  }
}
