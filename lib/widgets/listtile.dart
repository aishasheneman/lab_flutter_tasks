import 'package:flutter/material.dart';
import 'package:lab_task_5/models/listtilemod.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({super.key, required this.items});
  final ListTileMod items;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: items.cardColor,
      child: ListTile(
        title: Text(items.task , style: TextStyle(fontSize: 23),) ,
        subtitle: Text("Finshed in   ${items.finishDate}" , style: TextStyle(color: Colors.grey , fontWeight: FontWeight.bold ,fontSize: 16),),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
                ),
                child:IconButton(onPressed: (){}, icon: Icon(Icons.edit ,))),
                SizedBox(width: 7,),
                Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white
                ),
                child:IconButton(onPressed: (){}, icon: Icon(Icons.delete))),

          ],
        ),
      ),
    );
  }
}