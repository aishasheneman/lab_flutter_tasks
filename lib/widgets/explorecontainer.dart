import 'package:end_project/models/exmodel.dart';
import 'package:end_project/widgets/texsts_style.dart';
import 'package:flutter/material.dart';

class Explorecontainer extends StatelessWidget {
  const Explorecontainer({super.key});
  final List<ExModel> exploList = const[
    ExModel(containerColor: Color.fromARGB(255, 187, 227, 247), iconColor: Colors.lightBlue, icon: Icons.scuba_diving, text: "Snorkeling"),
    ExModel(containerColor: Color.fromARGB(255, 196, 240, 211), iconColor: Color.fromARGB(255, 6, 169, 190), icon: Icons.terrain, text: "Hiking"),
    ExModel(containerColor: Color.fromARGB(255, 219, 214, 235), iconColor: Colors.deepPurpleAccent, icon: Icons.kayaking, text: "Kayaking"),
    ExModel(containerColor: Color.fromARGB(255, 248, 214, 188), iconColor: Color.fromARGB(255, 238, 170, 118), icon: Icons.air, text: "Balloning"),
    ExModel(containerColor: Color.fromARGB(255, 159, 215, 241), iconColor: Colors.lightBlue, icon: Icons.scuba_diving, text: "Snorkeling"),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: exploList.length,
        itemBuilder: (context ,i){
          return GestureDetector(
            child: Container(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20 ,left: 20),
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: exploList[i].containerColor ,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Icon(exploList[i].icon ,size: 50, color: exploList[i].iconColor,),
                  ),
                  SizedBox(height: 5,),
                  NormalStyle(text: "${exploList[i].text}"),
                ],
              ),
            ),
          );
      }),
    );
  }
}