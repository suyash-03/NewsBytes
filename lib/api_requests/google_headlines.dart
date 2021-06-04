import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_bytes/models/google_model.dart';
import 'package:news_bytes/models/search_model.dart';

class GoogleList {
  List<dynamic> googleDynamic = [];
  List<GoogleModel> googleListFinal = [];
  String _title;
  String _url;
  String _urlToImage;
  String _publishedDate;
  String date;

  Future<List> getGoogleList() async {
    var response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?sources=google-news-in&apiKey=05a6e38c9b5943f7b5849e7e8b954fa2'));
    Map body = await jsonDecode(response.body);
    googleDynamic = body["articles"];
    print(googleDynamic.length);

    for (int i = 0; i < googleDynamic.length; i++) {
      _title = googleDynamic[i]["title"].toString();
      _url = googleDynamic[i]["url"].toString();
      _urlToImage = googleDynamic[i]["urlToImage"].toString();
       date = googleDynamic[i]["publishedAt"].toString();
      _publishedDate = date.substring(0,10);
      googleListFinal
          .add(GoogleModel(_title, _url, _urlToImage, _publishedDate));
    }
    return googleListFinal;
  }
}
