import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_bytes/Screens/sources_category.dart';
import 'package:news_bytes/singeltons/selectedcategory.dart';
import 'package:page_transition/page_transition.dart';


import '../shared/navigation_drawer.dart';
import 'home_screen.dart';



class Categories extends StatefulWidget {
  const Categories({Key key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();

}

class _CategoriesState extends State<Categories> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
          drawer: NavigationDrawerWidget(),
          backgroundColor: Colors.black,
          body: Column(children: <Widget>[
            Divider(
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,8,0,8),
              child: InkWell(
                child: Container(
                  child: Hero(
                    tag: 'business',
                    child: Card(
                      color: Colors.black,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'business',
                          style: TextStyle(color: Colors.white,
                          fontFamily: 'Playfair',
                          fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  appData.text = "business";
                  print(appData.text);
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: NewsCategory("business")));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,8,0,8),
              child: InkWell(
                child: Container(
                  child: Hero(
                    tag: 'entertainment',
                    child: Card(
                      color: Colors.black,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'entertainment',
                          style: TextStyle(color: Colors.white,
                              fontFamily: 'Playfair',
                              fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () {

                    appData.text = "entertainment";
                    print(appData.text);
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: NewsCategory("entertainment")));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,8,0,8),
              child: InkWell(
                child: Container(
                  child: Hero(
                    tag: 'general',
                    child: Card(
                      color: Colors.black,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'general',
                          style: TextStyle(color: Colors.white,
                              fontFamily: 'Playfair',
                              fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  appData.text = "general";
                  print(appData.text);
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: NewsCategory("general")));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,8,0,8),
              child: InkWell(
                child: Container(
                  child: Hero(
                    tag: 'health',
                    child: Card(
                      color: Colors.black,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'health',
                          style: TextStyle(color: Colors.white,
                              fontFamily: 'Playfair',
                              fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  appData.text = "health";
                  print(appData.text);
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: NewsCategory("health")));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,8,0,8),
              child: InkWell(
                child: Container(
                  child: Hero(
                    tag: 'science',
                    child: Card(
                      color: Colors.black,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'science',
                          style: TextStyle(color: Colors.white,
                              fontFamily: 'Playfair',
                              fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  appData.text = "science";
                  print(appData.text);
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: NewsCategory("science")));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,8,0,8),
              child: InkWell(
                child: Container(
                  child: Hero(
                    tag: 'sports',
                    child: Card(
                      color: Colors.black,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'sports',
                          style: TextStyle(color: Colors.white,
                              fontFamily: 'Playfair',
                              fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  appData.text = "sports";
                  print(appData.text);
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: NewsCategory("sports")));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0,8,0,8),
              child: InkWell(
                child: Container(
                  child: Hero(
                    tag: 'technology',
                    child: Card(
                      color: Colors.black,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'technology',
                          style: TextStyle(color: Colors.white,
                              fontFamily: 'Playfair',
                              fontSize: 30),
                        ),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  appData.text = "technology";
                  print(appData.text);
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade,
                          child: NewsCategory("technology")));
                },
              ),
            )
          ]),
    );
  }
}
