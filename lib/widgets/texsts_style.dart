import 'package:flutter/material.dart';

class BoldStyle extends StatelessWidget {
  const BoldStyle({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text("$text" , style: TextStyle(fontSize: 30 , fontWeight: FontWeight.bold),);
  }
}
class NormalStyle extends StatelessWidget {
  const NormalStyle ({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text("$text" , style: TextStyle(fontSize: 19,color: Colors.grey),);
  }
}

class BoldColordStyle extends StatelessWidget {
  const BoldColordStyle({super.key, required this.text, required this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text("$text" , style: TextStyle(color: color,fontSize: 30 , fontWeight: FontWeight.bold),);
  }
}

class MidStyle extends StatelessWidget {
  const MidStyle({super.key, required this.text});
  final String text;
  

  @override
  Widget build(BuildContext context) {
    return Text("$text" , style: TextStyle(fontSize: 22 ,), );
  }
}
