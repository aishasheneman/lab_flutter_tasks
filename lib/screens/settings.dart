import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        child: ListTile(
          title: Text("Dark Mode" , style: TextStyle(fontSize: 20),),
          trailing: Switch(value: (false), onChanged: (value){
            
          }),
        ),
      ),
    );
  }
}