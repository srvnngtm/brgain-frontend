import 'package:brgain/pages/categories_page.dart';
import 'package:brgain/pages/home.dart';
import 'package:brgain/pages/item_entries_page.dart';
import 'package:brgain/pages/items_page.dart';
import 'package:brgain/pages/login.dart';
import "package:flutter/material.dart";

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/home':
        // if(args is Map){
          return MaterialPageRoute(builder: (_) => Home(data : args));
        // }
        return _errorRoute();
      case '/login':
        return MaterialPageRoute(builder: (_) => Login());
      case '/category':
        return MaterialPageRoute(builder: (_) => CategoriesPage( data : args));
      case '/items':
        return MaterialPageRoute(builder: (_) => ItemsPage(data: args));
      case '/itemEntries':
        return MaterialPageRoute(builder: (_) => ItemEntriesPage(data: args));
      default :
        return _errorRoute();
    }
  }


  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(builder: (_){
      return Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
