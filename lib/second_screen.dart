import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key, required this.username});
  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Screen" ,style: TextStyle(color: Colors.white , fontSize: 25),),
        backgroundColor: const Color.fromARGB(255, 214, 68, 240),
      ),
      body: Center(
        child: Text("Hello ,$username \n\n This is Second Screen" ,
         style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold),),
      ),
    );
  }
}