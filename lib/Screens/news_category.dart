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
    // TODO: implement initState
    super.initState();
    final categoryList = Provider.of<CategoryList>(context,listen: false);
    _future = categoryList.getCategoryList();
  }
  @override
  Widget build(BuildContext context) {
    final categoryList = Provider.of<CategoryList>(context,listen: false);
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
                        fontSize: 60,
                        fontFamily: 'Playfair'),
                  ),
                ),
              )),
          Divider(
            color: Colors.grey,thickness: 5,
          ),
          Expanded(
            child: FutureBuilder(
                future: _future,
                builder: (context, AsyncSnapshot<List> snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        CategoryModel _categoryListFinal = snapshot.data[index];
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
                                          _categoryListFinal.name,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: 'Montserrat'),
                                        )),
                                    Padding(
                                        padding: const EdgeInsets.fromLTRB(10,0,10,2),
                                        child: Text(
                                          "language:"+_categoryListFinal.language,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontFamily: 'Montserrat'),
                                        )),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                                        child: Divider(color: Colors.grey,))
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: () async {
                            print("hello world");
                            String url = _categoryListFinal.url;
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
                  } else if (categoryList.status == "error") {
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
