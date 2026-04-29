import 'package:flutter/material.dart';

class ActionMenu extends StatelessWidget {
  final VoidCallback onMutePoints;
  final VoidCallback onBlock;

  const ActionMenu({
    super.key,
    required this.onMutePoints,
    required this.onBlock,
  });

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
//     return showDialog(
//                   context: context,
//                   barrierColor: Colors.transparent,
//                   builder: (context) {
//                     return Column(
//                       children: [
//                         GestureDetector(
//                           onTap: () => Navigator.pop(context),
//                           child: Container(color: Colors.transparent),
//                         ), 
//     Material(
//       color: Colors.transparent,
//       child: Container(
//         width: 220,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.1),
//               blurRadius: 10,
//               offset: const Offset(0, 5),
//             )
//           ],
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // 🔹 خيار منع النقاط
//             InkWell(
//               onTap: onMutePoints,
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: const [
//                     Text(
//                       "منع نقاط",
//                       style: TextStyle(fontSize: 14),
//                     ),
//                     Icon(Icons.settings, size: 18),
//                   ],
//                 ),
//               ),
//             ),

//             const Divider(height: 1),

//             // 🔴 خيار الحظر
//             InkWell(
//               onTap: onBlock,
//               child: Padding(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: const [
//                     Text(
//                       "حظر",
//                       style: TextStyle(fontSize: 14, color: Colors.red),
//                     ),
//                     Icon(Icons.block, size: 18, color: Colors.red),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     )]);
//   }
// }
