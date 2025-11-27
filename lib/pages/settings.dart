import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings , size: 80, color: Colors.grey,),
          SizedBox(height: 10,),
          Text("              Sorry! \n This page not build yet" , style: TextStyle(color: Colors.grey , fontSize: 20),)
        ],
      ),
    );
  }
}
