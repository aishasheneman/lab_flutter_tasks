import 'package:end_project/models/details.dart';
import 'package:end_project/pages/detialspage.dart';
import 'package:flutter/material.dart';

class Placesgrid extends StatelessWidget {
  const Placesgrid({super.key, required this.dets, required this.itemsnum});
  final List<Details> dets;
  final int itemsnum;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: itemsnum,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 400,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          crossAxisCount: 2,
        ),
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailedPage(dets: dets[i]),
                ),
              );
            },
            child: Container(
              width: 170,
              height: 800,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 270,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                      image: DecorationImage(
                        image: AssetImage(dets[i].image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
          padding: const EdgeInsets.only(left: 10 , bottom: 10 , top: 15),
          child: Text("${dets[i].name}",style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12 , bottom: 10),
          child: Row(children: List.generate(5, (index){
                          return Icon(index+1 <= dets[i].rating ? Icons.star : Icons.star_border , color: Colors.deepPurple,);
                      }),),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12 ),
          child: Text("${dets[i].price}\$" ,style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold , color: Colors.grey),),
        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
