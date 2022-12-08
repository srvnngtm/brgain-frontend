import 'package:brgain/services/http_requests.dart';
import 'dart:convert';


class ItemEntry{

  int itemEntryId;
  String itemEntryName;
  String imageUrl;
  String productUrl;
  int storeId;
  double price;



  ItemEntry({
    required this.itemEntryId,
    required this.itemEntryName,
    required this.imageUrl,
    required this.productUrl,
    required this.storeId,
    required this.price
  });



  factory ItemEntry.fromMap(Map map) {
    return ItemEntry( itemEntryId : map['itemEntryId'] as int,
        itemEntryName: map['itemEntryName'] as String,
        imageUrl: map['imageUrl'] as String,
        productUrl: map['productUrl'] as String,
      storeId: map['storeId'] as int,
      price: map['price'] as double,
    );
  }

  factory ItemEntry.fromJson(String str) => ItemEntry.fromMap(json.decode(str));


  static Future<List<ItemEntry>> getItemEntriesByItemId(int itemId) async {
    Map data = await HttpRequests.getItemsByCategoryFromAPI(itemId);
    print(data);
    List categoryData = data['data'];
    List<ItemEntry> itemEntryList =[];
    categoryData.forEach((element) {
      itemEntryList.add(ItemEntry.fromMap(element));
    });
    return itemEntryList;
  }

}