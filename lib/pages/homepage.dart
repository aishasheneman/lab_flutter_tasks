import 'package:end_project/models/allList.dart';
import 'package:end_project/models/details.dart';
import 'package:end_project/widgets/explorecontainer.dart';
import 'package:end_project/widgets/placesgrid.dart';
import 'package:end_project/widgets/texsts_style.dart';
import 'package:flutter/material.dart';


class Homepage extends StatefulWidget {
  const Homepage({super.key});


  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
   final List<Details> details = AllPlaces.all;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: ListView(
        children: [
          BoldStyle(text: "Explore"),
          SizedBox(height: 15,),
          Explorecontainer(),
          SizedBox(height: 30,),
          BoldStyle(text: "Places"),
          Placesgrid(dets: details, itemsnum: details.length)
        ],
      ),
    );
  }
}
