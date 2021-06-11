import 'package:animate_do/animate_do.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:news_bytes/Screens/categories_types.dart';
import 'package:news_bytes/Screens/search.dart';
import 'package:news_bytes/models/news_model.dart';
import 'package:news_bytes/api_requests/top_headlines.dart';
import 'package:provider/provider.dart';
import '../shared/loading.dart';
import '../shared/navigation_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List> _future;
  String imageURL;

  @override
  void initState() {
    final topHeadlines = Provider.of<TopHeadlines>(context, listen: false);
    _future = topHeadlines.getHeadlines();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final topHeadlines = Provider.of<TopHeadlines>(context, listen: false);
    topHeadlines.newsHeadlinesFinal.clear();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0.0,
          title: Text(
            "NewsBytes",
            style: TextStyle(
                color: Colors.white, fontFamily: 'OldLondon', fontSize: 42),
          ),
          bottom: TabBar(
            indicatorColor: Colors.grey,
            tabs: [
              Tab(
                icon: Icon(Icons.label),
                text: 'Latest in India',
              ),
              Tab(
                icon: Icon(Icons.category),
                text: 'Categories',
              ),
              Tab(
                icon: Icon(Icons.search_sharp),
                text: 'Search',
              ),
            ],
          ),
        ),
        drawer: NavigationDrawerWidget(),
        backgroundColor: Colors.black,
        body: TabBarView(
          children: [homePage(), Categories(), Search()],
        ),
      ),
    );
  }

  Widget homePage() {
    return Column(children: <Widget>[
      Divider(
        color: Colors.grey,
      ),
      Expanded(
        child: FutureBuilder(
            future: _future,
            builder: (context, AsyncSnapshot<List> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return RefreshIndicator(
                  onRefresh: () async {
                    final topHeadlines =
                        Provider.of<TopHeadlines>(context, listen: false);
                    topHeadlines.newsHeadlinesFinal.clear();
                    Future.delayed(Duration(seconds: 2));
                    _future = topHeadlines.getHeadlines();
                    print("Future Reloaded");
                  },
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      NewsModel _newsHeadlines = snapshot.data[index];
                      if (_newsHeadlines.urlImage == "null") {
                        return InkWell(
                          child: FadeInUp(
                              child: Container(
                                color: Colors.black,
                                child: Card(
                                  elevation: 0.0,
                                  color: Colors.black,
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        _newsHeadlines.title,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                            fontFamily: 'Playfair'),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20, 20, 0, 10),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        "${(_newsHeadlines.publishedDate).toString()}",
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
                          )),
                          onTap: () async {
                            print("hello world");
                            String url = _newsHeadlines.url;
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
                      } else if (_newsHeadlines.urlImage != "null") {
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
                                          _newsHeadlines.urlImage,
                                          fit: BoxFit.cover,
                                        ),
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          _newsHeadlines.title,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: 'Playfair'),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20, 20, 0, 10),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          "${(_newsHeadlines.publishedDate).toString()}",
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
                            String url = _newsHeadlines.url;
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
                      } else {
                        return null;
                      }
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
    ]);
  }
}
