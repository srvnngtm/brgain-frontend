import 'package:brgain/pages/home.dart';
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
