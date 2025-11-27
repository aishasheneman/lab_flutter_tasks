import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.search , size: 80, color: Colors.grey,),
          SizedBox(height: 10,),
          Text("       Sorry, Teacher! \n This page not build yet" , style: TextStyle(color: Colors.grey , fontSize: 20),)
        ],
      ),
    );
  }
}