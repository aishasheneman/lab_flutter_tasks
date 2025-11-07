import 'package:flutter/material.dart';
import 'package:lab_task_2/models/text_model.dart';

class ContainerWidger extends StatelessWidget {
  const ContainerWidger({super.key, required this.titleTexst, required this.infoText});
  final String titleTexst;
  final String infoText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      width: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titleTexst , style: TextStyleModel.heading,),
          Divider(thickness: 3,color: const Color.fromARGB(255, 3, 163, 184),),
          Text(infoText , style: TextStyleModel.textStyle,),
        ],
      ),
    );
  }
}
