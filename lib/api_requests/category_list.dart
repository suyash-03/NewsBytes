import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_bytes/models/category_model.dart';
import 'package:news_bytes/models/news_model.dart';

class CategoryList extends ChangeNotifier{

  List<dynamic> categoryDynamic=[];
  List<CategoryModel> categoryListFinal = [];
  String _name;
  String _url;
  String _language;
  String _description;
  String category;
  String status;
  
  Future<List> getCategoryList() async {
    var response = await http.get(Uri.parse('https://newsapi.org/v2/sources?category=business&apiKey=f6566def783f42ccbdfb3891b6f5dd5d'));
    Map body = await jsonDecode(response.body);
    status = body["status"];
    notifyListeners();
    categoryDynamic= body["sources"];
    print(categoryDynamic.length);

    for(int i=0;i<categoryDynamic.length;i++){
      _name = categoryDynamic[i]["name"].toString();
      _url = categoryDynamic[i]["url"].toString();
      _language=categoryDynamic[i]["language"].toString();
      _description=categoryDynamic[i]["description"];
      categoryListFinal.add(CategoryModel(_name, _url, _language, _description));
    }
    return categoryListFinal;
  }
  
  
  
  
}