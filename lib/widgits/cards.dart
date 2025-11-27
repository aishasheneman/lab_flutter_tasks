import 'package:flutter/material.dart';
import 'package:lab_task_4/models/cardmodels.dart';

class Cards extends StatelessWidget {
  const Cards({super.key, required this.items});
  final Cardmodels items;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 600,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
          )
        ]
        
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
        Container(
          width: double.infinity,
          height: 175,
          color: Colors.grey[400],
          child: Image.asset(items.imgpath , width: 70) ,
        ),
        
        Padding(
          padding: const EdgeInsets.only(left: 10 , bottom: 10 , top: 23),
          child: Text(items.name ,style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12 ),
          child: Text(items.price ,style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold , color: Colors.grey),),
        ),
        
      ],),
    );
  }
}