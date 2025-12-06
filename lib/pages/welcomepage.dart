import 'package:end_project/pages/indexpage.dart';
import 'package:end_project/widgets/texsts_style.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key, required this.username});
  final String username;

  final List images = const [
    "assets/images/112.jpg",
    "assets/images/113.jpg",
    "assets/images/114.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount:images.length ,
        itemBuilder: (context ,index){
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
             image: DecorationImage(image: Image.asset(images[index]).image,
             fit: BoxFit.fill

             ),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 80 , left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BoldStyle(text: "Welcome $username in \nTrips"),
                      BoldColordStyle(text: "Mountain", color: Colors.grey),
                      SizedBox(height: 18,),
                      Container(
                        width: 250,
                        child: NormalStyle(text: "Mountain hikes give you an incredible sense of freedom aling with edurance test")
                       
                      ),
                       Padding(
                         padding: const EdgeInsets.only(left: 30 , top: 20),
                         child: MaterialButton(
                          padding: EdgeInsets.only(top: 5,bottom: 5,left: 5 , right: 15),
                          color: Colors.deepPurple,
                          child: Text("     >>>" , style: TextStyle(color: Colors.white , fontSize: 25) ,),
                          onPressed: (){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>Indexpage(name: username,)));
                          },
                         ),
                       )
                    ],
                  ),
                
                  Column(
                    children: List.generate(3, (indexDots){
                      return  Container(
                        margin: EdgeInsets.only(right: 10 , bottom: 2),
                        width: 6,
                        height: index==indexDots?25:15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: index==indexDots? Colors.deepPurple:Colors.deepPurple.withOpacity(0.3),
                        ),
                      );
                    }) )
                                ],
              ),
            ),
            
          );
      }),
    );
  }
}
