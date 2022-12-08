import 'package:brgain/models/item.dart';
import 'package:brgain/item_list.dart';
import 'package:brgain/pages/store_picker.dart';
import 'package:brgain/services/route_generator.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:brgain/pages/home.dart';
import 'package:brgain/pages/login.dart';
import 'package:brgain/pages/signup.dart';
import 'card_widget.dart';

void main() => runApp(MaterialApp(
      // home: Login(),
  // home: Home(),
  //     routes: {
  //       // "/home" : (context ) => Home(),
  //       "/login": (context) => Login(),
  //       "/signup": (context) => Signup(),
  //       "/storePicker": (context) => StorePicker(),
  //     },
  //   )
    initialRoute: '/home',
onGenerateRoute: RouteGenerator.generateRoute
),

);



// class QuoteList extends StatefulWidget {
//   const QuoteList({Key? key}) : super(key: key);
//
//   @override
//   State<QuoteList> createState() => _QuoteListState();
// }


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
