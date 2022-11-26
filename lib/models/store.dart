import 'package:brgain/services/http_requests.dart';
import 'dart:convert';

class Store{

  int storeId;
  String storeName;
  String storeImageUrl;

  Store({required this.storeId,
    required this.storeName,
    required this.storeImageUrl});

  factory Store.fromMap(Map map) {
    return Store( storeId : map['storeId'] as int,
                  storeName: map['storeName'] as String,
                  storeImageUrl: map['storeImageUrl'] as String);
  }

  factory Store.fromJson(String str) => Store.fromMap(json.decode(str));



  static Future<List<Store>> getAllStores() async {
    Map data = await HttpRequests.getAllStoresFromAPI();

    List storeData = data['data'];
    List<Store> storeList =[];

    storeData.forEach((element) {
      storeList.add(Store.fromMap(element));
    });

    return storeList;
  }

}