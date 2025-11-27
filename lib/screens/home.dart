import 'package:flutter/material.dart';
import 'package:lab_task_4/models/cardmodels.dart';
import 'package:lab_task_4/widgits/cards.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
  final List<Cardmodels> items = [
    Cardmodels(imgpath: "images/1.png", name: "Laptop Dell", price: "200\$"),
    Cardmodels(imgpath: "images/2.png", name: "Wireless Earbuds", price: "7\$"),
    Cardmodels(imgpath: "images/3.png", name: "Desktop Computer", price: "120\$"),
    Cardmodels(imgpath: "images/4.png", name: "Wireless Earbuds", price: "7\$"),
    Cardmodels(imgpath: "images/5.png", name: "Canon_EOS_750D", price: "250\$"),
    Cardmodels(imgpath: "images/6.png", name: "Wireless Microphone", price: "200\$"),
    
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 300,
          mainAxisSpacing: 18,
          crossAxisSpacing: 18
          ),
        itemCount: items.length,
        
         itemBuilder: (context ,i){
          return Cards(items: items[i]);
         }),
    );
  }
}