import 'package:flutter/material.dart';
import 'package:lab_task_2/models/text_model.dart';
import 'package:lab_task_2/widgets/contact.dart';
import 'package:lab_task_2/widgets/container_wid.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("CV" , style:TextStyleModel.heading ,),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                   margin: EdgeInsets.only(left: 20),
                  color: const Color.fromARGB(255, 221, 238, 247),
                  width: 220,
                  height: 770,
                        
                ),
                Container(
                  margin: EdgeInsets.only(top: 70),
                  color: Colors.cyan,
                  width: double.infinity,
                  height: 90,
                ),
                Positioned(
                  left: 50,
                  top: 20,
                  child: CircleAvatar(
                              radius: 65,
                              backgroundImage: AssetImage("images/1.jpg" ),
                            ),
                ),
                Positioned(
                  top: 75,
                  right: 30,
                  child: SizedBox(
                    width: 350,
                    child: ListTile(
                      title: Text("Aisha Sheneman",textAlign: TextAlign.end , style: TextStyle(color: Colors.white,fontSize: 25 , fontWeight: FontWeight.bold)),
                      subtitle: Text("Mobile App Developer",textAlign: TextAlign.end, style: TextStyle(color: Colors.white70 , fontSize: 20 ,fontWeight:FontWeight.w500 ),),),
                    ),
                  ),
                Positioned(
                  top: 230,
                  left: 20,
                  child: Column(

                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("CONTACT" , style: TextStyleModel.heading ),
                                Divider(thickness: 3,color: const Color.fromARGB(255, 3, 163, 184),),
                                ContactWidget(icon: Icons.email, infoText: "aisha@gmail.com"),
                                ContactWidget(icon: Icons.phone, infoText: "+967 777-777-777"),
                                ContactWidget(icon: Icons.location_pin, infoText: "Hadramout-Tariba"),
                              ],
                            ),
                          ),
                          SizedBox(
                        width: 35,
                      ),
                          ContainerWidger(titleTexst: "Education", infoText: "Bachelor of Science \nin Information Technology\nSeiyun Universty.\nGraduation: 2026"),
                        ],
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Row(
                        children: [
                         ContainerWidger(titleTexst: "Skills", infoText: "- Develop Apps with \n  flutter & C#\n- Problem-Solving\n- Team Leadership"),
                          SizedBox(
                        width: 35,
                      ),
                        ContainerWidger(titleTexst: "Experience", infoText: "- Built cross-platform \nFlutter mobile application ")
                        ],
                      ),
                      
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
