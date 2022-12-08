import 'package:brgain/models/item.dart';
import 'package:flutter/material.dart';
import 'package:brgain/services/http_requests.dart';
import 'dart:convert';
import 'package:brgain/models/category.dart';

class CategoriesPage extends StatefulWidget {
  Object? data = {};

  CategoriesPage({required this.data});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {


  @override
  Widget build(BuildContext context) {

    List<Category> categoryList  = (widget.data as Map )["categories"] as List<Category>;

    // Category.getAllCategories().then((value) => categoryList = value);
    print("inside category build");
    print(categoryList);
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text("Categories"),
    //     centerTitle: true,
    //   ),
    //   body: ListView(
    //     children: categoryList.map((e) =>  Text(e.categoryName)
    //     ).toList(),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
        centerTitle: true,
      ),
      body: GridView.builder(
          itemCount: categoryList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 5,
              crossAxisSpacing: 10,
              mainAxisSpacing: 15
          ),
          itemBuilder: (context, index) {
            return GridItem(
              item: categoryList[index]
            );
          }),

    );

  }
}



class GridItem extends StatefulWidget {
  final Category item;

  GridItem({required this.item});

  @override
  _GridItemState createState() => _GridItemState();
}

class _GridItemState extends State<GridItem> {

  @override
  Widget build(BuildContext context) {
    // isSelected = widget.isSel;
    return InkWell(
      onTap: () {
        onPressedEachCategory(context, widget.item.categoryId);
      },
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
            padding: EdgeInsets.all(20),
              width: 300,
              color: Colors.lightGreen,
              child: Center(
                child: Text(widget.item.categoryName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2
                ),
                ),
              ))
          // Image.network(
          //   widget.item.storeImageUrl,
          //   color: Colors.black.withOpacity(isSelected ? 0.9 : 0),
          //   colorBlendMode: BlendMode.color,
          // ),
      //     isSelected
      //         ? const Align(
      //       alignment: Alignment.bottomRight,
      //       child: Padding(
      //         padding: EdgeInsets.all(8.0),
      //         child: Icon(
      //           Icons.check_circle,
      //           color: Colors.blue,
      //         ),
      //       ),
      //     // )
      //         : Container()
        ],
      ),
    );
  }
}



void  onPressedEachCategory(BuildContext context, int categoryId) async {
  try{
    List<Item> itemsByCategory = await Item.getItemsByCategory(categoryId);
    Navigator.pushNamed(context, "/items", arguments: {"items" : itemsByCategory});

  }catch(e){
    print(e);
    showSnackBar(context, "unable to fetch items");
  }
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

