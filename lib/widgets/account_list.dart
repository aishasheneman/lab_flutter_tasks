import 'package:end_project/models/account_settings.dart';
import 'package:flutter/material.dart';


class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key, required this.item });
  final SettingsModel item;

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(children: [
        Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.deepPurple
                ),
                child: Icon(item.icon , color: Colors.white, size: 27,),),
                 Spacer(),
                Text(item.setText , style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                Spacer(flex: 2,),
                IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_forward_ios_outlined, size: 20,))
      ],),
    );
  }
}