import 'package:brgain/services/http_requests.dart';
import 'dart:convert';


class Category{

  int categoryId;
  String categoryName;


  Category({required this.categoryId, required this.categoryName});

  factory Category.fromMap(Map map) {
    return Category( categoryId : map['categoryId'] as int,
        categoryName: map['categoryName'] as String);
  }

  factory Category.fromJson(String str) => Category.fromMap(json.decode(str));



  static Future<List<Category>> getAllCategories() async {
    Map data = await HttpRequests.getAllCategoriesFromAPI();
    print(data);
    List categoryData = data['data'];
    List<Category> categoryList =[];
    categoryData.forEach((element) {
      categoryList.add(Category.fromMap(element));
    });
    return categoryList;
  }

}