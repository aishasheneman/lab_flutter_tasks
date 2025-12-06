import 'package:end_project/pages/login.dart';
import 'package:end_project/pages/welcomepage.dart';
import 'package:end_project/widgets/texsts_style.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  void initState(){
    Future.delayed(Duration(seconds: 3),()async{
      WidgetsFlutterBinding.ensureInitialized();
      final prefs = await SharedPreferences.getInstance();
      final username = prefs.getString("username");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>username == null ? Login(): WelcomePage( username: username)));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(bottom:20),
        child: Column(
          children: [
            Expanded(child: Center(
             child:Image.asset("assets/images/logo1.png" , width: 250, height: 250,),)),
             NormalStyle(text: "Developed By Aisha Sheneman"),
          ],
        ),
      ),
    );
  }
}