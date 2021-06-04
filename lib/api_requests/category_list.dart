import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_bytes/models/category_model.dart';
import 'package:news_bytes/singeltons/selectedcategory.dart';
import 'package:news_bytes/Screens/categories_types.dart';

class CategoryList{


  Categories categories = Categories();

  List<dynamic> categoryDynamic=[];
  List<CategoryModel> categoryListFinal = [];
  String _name;
  String _url;
  String _language;
  String _description;
  String status;


  
  Future<List> getCategoryList() async {

    // getting category name from previous screen (categories)


    var response = await http.get(Uri.parse('https://newsapi.org/v2/sources?category='+appData.text+'&apiKey=f6566def783f42ccbdfb3891b6f5dd5d'));
    Map body = await jsonDecode(response.body);
    status = body["status"];
    categoryDynamic= body["sources"];
    print(categoryDynamic.length);

    for(int i=0;i< categoryDynamic.length;i++){
      _name = categoryDynamic[i]["name"].toString();
      _url = categoryDynamic[i]["url"].toString();
      _language=categoryDynamic[i]["language"].toString();
      _description=categoryDynamic[i]["description"];
      categoryListFinal.add(CategoryModel(_name, _url, _language, _description));
    }
    return categoryListFinal;
  }
  
  
  
  
}