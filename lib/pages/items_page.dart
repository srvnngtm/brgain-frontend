import 'dart:math';

import 'package:brgain/models/item_entry.dart';
import 'package:flutter/material.dart';
import 'package:brgain/services/http_requests.dart';
import 'dart:convert';
import 'package:brgain/models/item.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemsPage extends StatefulWidget {
  Object? data = {};

  ItemsPage({required this.data});

  @override
  State<ItemsPage> createState() => _ItemsPageState();
}

class _ItemsPageState extends State<ItemsPage> {
  @override
  Widget build(BuildContext context) {
    List<Item> itemsList = (widget.data as Map)["items"] as List<Item>;
    print("inside items build");
    print(itemsList);

    return Scaffold(
      appBar: AppBar(
        title: Text("Items"),
        centerTitle: true,
      ),
      body: GridView.builder(
          itemCount: itemsList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.85,
              crossAxisSpacing: 1,
              mainAxisSpacing: 5,),
          itemBuilder: (context, index) {
            return GridItem(item: itemsList[index]);
          }),
    );
  }
}

class GridItem extends StatefulWidget {
  final Item item;

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
          onPressedItem(context, widget.item.itemId);

        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.network(
              widget.item.itemImage,
              // color: Colors.black.withOpacity(isSelected ? 0.9 : 0),
              colorBlendMode: BlendMode.color,
              errorBuilder: (context, error, stackTrace) => SvgPicture.network(
                widget.item.itemImage,
                // for .svg extension
              ),
            ),
            SizedBox(height: 10,),
            Flexible(
              fit: FlexFit.loose,
                child: Text(
                    widget.item.itemName.substring(0,min(widget.item.itemName.length, 20)),
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[900]
                  ),

                )),
          ],
        )

        );
  }
}




void  onPressedItem(BuildContext context, int itemId) async {
  try{
    List<ItemEntry> itemEntries = await ItemEntry.getItemEntriesByItemId(itemId);
    Navigator.pushNamed(context, "/itemEntries", arguments: {"itemEntries" : itemEntries});

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

