import 'package:flutter/material.dart';
import 'package:lab_task_4/models/account_settings.dart';
import 'package:lab_task_4/widgits/account_List.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});
  final List<SettingsModel>settingsItems = const[
    SettingsModel(icon: Icons.edit_outlined, setText: 'Edit Profile'),
    SettingsModel(icon: Icons.notifications_outlined, setText: 'Notification'),
    SettingsModel(icon: Icons.location_on_outlined, setText: 'Shipping Address'),
    SettingsModel(icon: Icons.lock_outline, setText: 'Change Password'),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25 ),
          child: Column(
           crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Stack(
            children: [
             const CircleAvatar(
                radius:70 ,
                backgroundColor:Colors.amber,
                child: CircleAvatar(
                  radius: 67,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 63,
                    backgroundColor: Colors.grey,
                    
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child:  Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.amber
                ),
                child: const Icon(Icons.edit , color: Colors.white, size: 20,),),),
            ], 
            ),
           const ListTile(
              title: Text('Aisha Sheneman', textAlign: TextAlign.center,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              subtitle: Text('Developer', textAlign: TextAlign.center),
            ),
            SizedBox(height: 20,),
            ...settingsItems.map((e) => SettingsWidget(item: e)).toList(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100 , vertical: 25),
              child: MaterialButton(
              //  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                color: Colors.amber,
                onPressed: (){},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout ,color: Colors.white, ),
                   const SizedBox(width: 10,),
                    Text("Sign Out" , style:const TextStyle(fontWeight: FontWeight.bold , color: Colors.white , fontSize: 20),),
                  ],
                ),
                ),
            ),
          ],
          ),
        ),
      );
  }
}
