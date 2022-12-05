import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:brgain/services/http_requests.dart';
import 'package:brgain/pages/NavDrawer.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class Home extends StatefulWidget {
  Object? data = {};
  Map loginUser = {};

  Home({required this.data});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    // Map? data =  ModalRoute.of(context)?.settings.arguments as Map?;
    print(widget.data);
    if (widget.data == null || widget.data is! Map) {
      print("if");
      print(widget.data);
      initHomePageData().then((value) => {
            // widget.loginUser = value['data'],
            // setState(() {
              loginUser = value['data'];
            // })
          });
    } else {
      print("else");
      widget.loginUser = (widget.data as Map)['user'];
    }
  }

  @override
  Widget build(BuildContext context) {
    Map user = widget.loginUser;
    print("Build of home ${widget.loginUser}");

    return Scaffold(
        appBar: AppBar(
          title: Text("BRgain"),
          centerTitle: true,
        ),
        drawer: NavDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              alignment: Alignment.center,
              child: const Text( "Welcome",
              style: TextStyle(
                fontSize: 40
              ),),
            ),
            Text( " ${user['userName']} ",
            style: const TextStyle(
              fontSize: 30
            ),),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: imageSliders,
            ),
            const SizedBox(height: 50),
            Container(
              width: 400,
              height: 100,
              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
              decoration: const BoxDecoration(
                // borderRadius: BorderRadius.all(Radius.circular(200)),
                color: Colors.red,
              ),
              child: ElevatedButton(
                onPressed: ()=>{},
                child: const Text('Login'),
              ),

            )
          ],
        ));
  }




  final List<Widget> imageSliders = imgList
      .map((item) => Container(
  child: Container(
  margin: EdgeInsets.all(5.0),
  child: ClipRRect(
  borderRadius: BorderRadius.all(Radius.circular(5.0)),
  child: Stack(
  children: <Widget>[
  Image.network(item, fit: BoxFit.cover, width: 1000.0),
  Positioned(
  bottom: 0.0,
  left: 0.0,
  right: 0.0,
  child: Container(
  decoration: BoxDecoration(
  gradient: LinearGradient(
  colors: [
  Color.fromARGB(200, 0, 0, 0),
  Color.fromARGB(0, 0, 0, 0)
  ],
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
  ),
  ),
  padding: EdgeInsets.symmetric(
  vertical: 10.0, horizontal: 20.0),
  child: Text(
  'No. ${imgList.indexOf(item)} image',
  style: TextStyle(
  color: Colors.white,
  fontSize: 20.0,
  fontWeight: FontWeight.bold,
  ),
  ),
  ),
  ),
  ],
  )),
  ),
  ))
      .toList();
}




Future<Map> initHomePageData() async {
  Map loginUser = await HttpRequests.loginUser("1", "1");
  return loginUser;
}

void showSnackBar(BuildContext context, String text) {
  final snackBar = SnackBar(
    content: Text(text),
    duration: Duration(seconds: 1),
    //default is 4s
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24),
    ),
    margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 100, right: 20, left: 20),
  );
  // Find the Scaffold in the widget tree and use it to show a SnackBar.
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}


