import 'package:end_project/models/account_settings.dart';
import 'package:end_project/pages/login.dart';
import 'package:end_project/widgets/account_list.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
                backgroundColor:Colors.deepPurple,
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
                  color: Colors.deepPurple
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
                color: Colors.deepPurple,
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.remove("username");

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => Login()),
                  );
                },
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
