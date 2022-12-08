import 'package:brgain/services/http_requests.dart';
import 'dart:convert';

class Item {
  String itemName;

  int itemId;

  int categoryId;

  String itemImage;


  // {
  // "itemId": 134,
  // "itemName": "Horizon Organic Growing Years Whole Milk with DHA ",
  // "categoryId": 2,
  // }

  // Item({required String name,
  //       required String imageLink,
  //       required String productLink}) {
  //
  //   this.name = name;
  //   this.imageLink = imageLink;
  //   this.productLink = productLink;
  // }

  Item({
    required this.itemId,
    required this.itemName,
    required this.categoryId,
    required this.itemImage
  });

  // Item({required this.name, required this.imageLink, required this.productLink});


  factory Item.fromMap(Map map) {
    return Item( itemId : map['itemId'] as int,
        itemName: map['itemName'] as String,
        itemImage: map['itemImage'] as String,
        categoryId: map['categoryId'] as int);
  }

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));


  static Future<List<Item>> getItemsByCategory(int categoryId) async {
    Map data = await HttpRequests.getItemsByCategoryFromAPI(categoryId);
    print(data);
    List categoryData = data['data'];
    List<Item> itemList =[];
    categoryData.forEach((element) {
      itemList.add(Item.fromMap(element));
    });
    return itemList;
  }

}
