import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_bytes/models/news_model.dart';
import 'package:provider/provider.dart';

class TopHeadlines {

  List<dynamic> newsDynamic=[];
  List<NewsModel> newsHeadlinesFinal = [];
  String _title;
  String _url;
  String _urlImage;
  String _publishedDate;
  String date;
  String status;

  Future<List> getHeadlines() async{
    var response = await http.get(Uri.parse("https://newsapi.org/v2/top-headlines?country=in&apiKey=f6566def783f42ccbdfb3891b6f5dd5d"));
    Map body = await jsonDecode(response.body);
    status = body["status"];


    newsDynamic = body["articles"];
    print(newsDynamic.length);

    for(int i =0 ; i< newsDynamic.length;i++){

      _title=newsDynamic[i]["title"].toString();
      _url=newsDynamic[i]["url"].toString();
      _urlImage=newsDynamic[i]["urlToImage"].toString();
      date=newsDynamic[i]["publishedAt"].toString();
      _publishedDate = date.substring(0,10);


      newsHeadlinesFinal.add(NewsModel(_title, _url, _urlImage,_publishedDate));
    }
    // print(newsHeadlinesFinal);
    return newsHeadlinesFinal;
  }
}
