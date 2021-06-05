import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_bytes/models/news_model.dart';
import 'package:provider/provider.dart';

class TopHeadlines {

  List<dynamic> newsDynamic=[];
  List<NewsModel> newsHeadlinesFinal = [];
  String title;
  String url;
  String urlImage;
  String publishedDate;
  String date;
  String status;

  Future<List> getHeadlines() async{
    var response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=in&apiKey=f6566def783f42ccbdfb3891b6f5dd5d"));
    Map body = await jsonDecode(response.body);
    status = body["status"];


    newsDynamic = body["articles"];
    print(newsDynamic.length);

    for(int i =0 ; i< newsDynamic.length;i++){

      title=newsDynamic[i]["title"].toString();
      url=newsDynamic[i]["url"].toString();
      urlImage=newsDynamic[i]["urlToImage"].toString();
      date=newsDynamic[i]["publishedAt"].toString();
      publishedDate = date.substring(0,10);


      newsHeadlinesFinal.add(NewsModel(title,url,urlImage,publishedDate));
    }
    // print(newsHeadlinesFinal);
    return newsHeadlinesFinal;
  }
}
