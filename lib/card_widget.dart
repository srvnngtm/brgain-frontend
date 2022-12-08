// import 'package:flutter/material.dart';
// import 'item.dart';
//
// class CardWidget extends StatelessWidget {
//
//   final Item item;
//   final Function() delete;
//
//   CardWidget( {required this.item, required this.delete } );
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
//       child: Padding(
//         padding: EdgeInsets.all(10),
//         child: Column(
//           children: [
//             Image(image: NetworkImage(item.imageLink
//                 , scale: 2.5)),
//             SizedBox(height: 10,),
//             Text(item.name),
//             SizedBox(height: 10,),
//             SafeArea(child: SafeArea(
//               child: Text("Asass"),
//             )),
//             TextButton.icon(
//                 onPressed: delete,
//                 icon: Icon(Icons.delete),
//                 label: Text("delete"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }