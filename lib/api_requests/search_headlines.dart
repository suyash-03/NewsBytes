import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_bytes/models/search_model.dart';
import 'package:news_bytes/singeltons/searchkeyword.dart';

class SearchList{


  List<dynamic> searchDynamic=[];
  List<SearchModel> searchListFinal = [];
  String _title;
  String _url;
  String _urlToImage;
  String _sourceName;


  Future<List> getSearchList() async {

    var response = await http.get(Uri.parse('https://newsapi.org/v2/everything?q='+keyData.text+'&apiKey=05a6e38c9b5943f7b5849e7e8b954fa2'));
    Map body = await jsonDecode(response.body);
    searchDynamic= body["articles"];
    print(searchDynamic.length);

    for(int i=0;i< searchDynamic.length;i++){
      _title = searchDynamic[i]["title"].toString();
      _url = searchDynamic[i]["url"].toString();
      _urlToImage=searchDynamic[i]["urlToImage"].toString();
      _sourceName = searchDynamic[i]["source"]["name"].toString();
      searchListFinal.add(SearchModel(_title, _url, _urlToImage ,_sourceName ));
    }
    return searchListFinal;
  }




}