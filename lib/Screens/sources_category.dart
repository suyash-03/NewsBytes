import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:news_bytes/api_requests/category_list.dart';
import 'package:news_bytes/models/category_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../loading.dart';
import 'home_screen.dart';

class NewsCategory extends StatefulWidget {
  final String category;

  NewsCategory(this.category);

  @override
  _NewsCategoryState createState() => _NewsCategoryState();
}

class _NewsCategoryState extends State<NewsCategory> {

  Future<List> _future;

  @override
  void initState() {
    final categoryList = Provider.of<CategoryList>(context, listen: false);
    _future = categoryList.getCategoryList();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final categoryList = Provider.of<CategoryList>(context, listen: false);
    categoryList.categoryListFinal.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Hero(
              tag: '${widget.category}',
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 0, 10),
                  child: Text(
                    "${widget.category}:",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontFamily: 'Playfair'),
                  ),
                ),
              )),
          Divider(
            color: Colors.grey,
            thickness: 5,
          ),
          Expanded(
            child: FutureBuilder(
                future: _future,
                builder: (context, AsyncSnapshot<List> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        CategoryModel _categoryHeadlines = snapshot.data[index];
                        return InkWell(
                          child: FadeInUp(
                            child: Container(
                              color: Colors.black,
                              height: MediaQuery.of(context).size.height / 1.5,
                              width: MediaQuery.of(context).size.height / 1.5,
                              child: Card(
                                elevation: 0.0,
                                color: Colors.black,
                                child: Column(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        child: Image.network(
                                          _categoryHeadlines.urlImage == null
                                              ? 'https://picsum.photos/300'
                                              : _categoryHeadlines.urlImage,
                                          fit: BoxFit.cover,
                                        ),
                                        width: MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Text(
                                          _categoryHeadlines.title,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 28,
                                              fontFamily: 'Playfair'),
                                        )),
                                    Padding(
                                      padding:
                                      const EdgeInsets.fromLTRB(20, 20, 0, 10),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(_categoryHeadlines.publishedDate,
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
                            String url = _categoryHeadlines.url;
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