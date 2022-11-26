import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert' as convert;

class HttpRequests{
  static String baseUrl =  "http://10.0.2.2:8080/";


  static String getLoginUrl() =>  baseUrl + "user/login";
  static String getRegisterUrl() =>  baseUrl + "user/register";
  static String getAllStores() =>  baseUrl + "store/all";

  static Future<Map> loginUser(String email, String password) async {
    print("inside login user");
    String url = getLoginUrl();
    Map params = new Map();
    params['email'] = email;
    params['password'] = password;
    url = setParams(url, params);
    print(url);
    Response response =  await post(Uri.parse(url));
    Map data = convert.jsonDecode(response.body);
    print(data);
    return data;
  }


  static Future<Map> registerUser(String email, String password, String name) async {
    print("inside register user");
    String url = getRegisterUrl();
    Map params = new Map();
    params['email'] = email;
    params['password'] = password;
    params['username'] = name;
    url = setParams(url, params);
    print(url);
    Response response =  await post(Uri.parse(url));
    Map data = convert.jsonDecode(response.body);
    print(data);
    return data;
  }

  static Future<Map> getAllStoresFromAPI() async {
    print("inside get all stores");
    String url = getAllStores();
    print(url);
    Response response =  await get(Uri.parse(url));
    Map data = convert.jsonDecode(response.body);
    return data;
  }





  static String setParams(String url, Map params) {
    url = url + "?";
    for( MapEntry e in params.entries){
      url = url + e.key + "=" +  e.value+ "&";
    }
    return url;
  }

}