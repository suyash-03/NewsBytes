import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:news_bytes/api_requests/google_headlines.dart';
import 'package:news_bytes/api_requests/search_headlines.dart';
import 'package:news_bytes/models/google_model.dart';
import 'package:news_bytes/models/search_model.dart';
import 'package:news_bytes/singeltons/searchkeyword.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../shared/loading.dart';

class GoogleResults extends StatefulWidget {
  const GoogleResults({Key key}) : super(key: key);

  @override
  _GoogleResultsState createState() => _GoogleResultsState();
}

class _GoogleResultsState extends State<GoogleResults> {
  Future<List> _future;

  @override
  void initState() {
    final searchList = Provider.of<GoogleList>(context, listen: false);
    _future = searchList.getGoogleList();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final searchList = Provider.of<GoogleList>(context, listen: false);
    searchList.googleListFinal.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
              child: Text(
                "Google News",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontFamily: 'Playfair'),
              ),
            ),
          ),
          Divider(
            color: Colors.grey,
            thickness: 5,
          ),
          Expanded(
            child: FutureBuilder(
                future: _future,
                builder: (context, AsyncSnapshot<List> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        final searchList = Provider.of<GoogleList>(context, listen: false);
                        searchList.googleListFinal.clear();
                        Future.delayed(Duration(seconds: 2));
                        _future = searchList.getGoogleList();
                        print("Future Reloaded");
                      },
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          GoogleModel _googleHeadlines = snapshot.data[index];
                          return InkWell(
                            child: FadeInUp(
                              child: Container(
                                color: Colors.black,
                                height: MediaQuery.of(context).size.height / 2.2,
                                width: MediaQuery.of(context).size.width,
                                child: Card(
                                  elevation: 0.0,
                                  color: Colors.black,
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          child: Image.network(
                                            _googleHeadlines.urlImage == "null"
                                                ? 'https://picsum.photos/300'
                                                : _googleHeadlines.urlImage,
                                            fit: BoxFit.cover,
                                          ),
                                          width: MediaQuery.of(context).size.width,
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Text(
                                            _googleHeadlines.title,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 22,
                                                fontFamily: 'Playfair'),
                                          )),
                                      Padding(
                                        padding:
                                        const EdgeInsets.fromLTRB(20, 20, 0, 10),
                                        child: Align(
                                          alignment: Alignment.bottomLeft,
                                          child: Text(_googleHeadlines.date,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Montserrat'),
                                          ),
                                        ),
                                      ),
                                      Divider(
                                        color: Colors.grey,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            onTap: () async {
                              print("hello world");
                              String url = _googleHeadlines.url;
                              if (await canLaunch(url)) {
                                await launch(url,
                                    forceSafariVC: true,
                                    forceWebView: true,
                                    enableJavaScript: true);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                          );
                        },
                      ),
                    );
                  } else if (snapshot.connectionState == ConnectionState.none) {
                    return Center(
                      child: Text(
                        "Can't Fetch API data\n"
                            "     Try again Later",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    );
                  } else
                    return Loading();
                }),
          ),
        ],
      ),
    );
  }
}
