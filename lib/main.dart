import 'package:brgain/item.dart';
import 'package:brgain/item_list.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:brgain/home.dart';
import 'package:brgain/login.dart';

import 'card_widget.dart';

void main() => runApp(MaterialApp(
      home: Login(),
      // routes: {
      //   // "/" : (context ) => Home(),
      //   "/login": (context) => Login()
      //   // "/q" : (context) => QuoteList(),
      // },
    ));



// class QuoteList extends StatefulWidget {
//   const QuoteList({Key? key}) : super(key: key);
//
//   @override
//   State<QuoteList> createState() => _QuoteListState();
// }

//
// class _QuoteListState extends State<QuoteList> {
//
//   List<Item> items = ItemList().getItemList();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Beverages"),
//         centerTitle: true,
//       ),
//       body: ListView(
//         children: items.map((e) =>  CardWidget(
//           item: e,
//           delete: (){
//             setState(() {
//               items.remove(e);
//             });
//           } ,
//
//         )).toList(),
//       ),
//     );
//   }
//
// }
