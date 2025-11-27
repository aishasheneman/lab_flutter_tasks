import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.account_circle_outlined , size: 80, color: Colors.grey,),
          SizedBox(height: 10,),
          Text("              Sorry! \n This page not build yet" , style: TextStyle(color: Colors.grey , fontSize: 20),)
        ],
      ),
    );
  }
}