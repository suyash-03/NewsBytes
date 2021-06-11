import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_bytes/Screens/home_screen.dart';
import 'package:news_bytes/api_requests/top_headlines.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Screens/google_news.dart';
import '../Screens/categories_types.dart';

class NavigationDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
          color: Colors.black,
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: Image.network(''
                    'https://wallpapercave.com/wp/wp5590836.jpg',
                fit: BoxFit.cover,)
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.home,
                    color: Colors.grey,
                  ),
                  title: Text(
                    'Home',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () => selectedItem(context, 0),
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.google,
                    color: Colors.grey,
                  ),
                  title: Text(
                    'Google News',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () => selectedItem(context, 1),
                ),
              ),
              Divider(
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.flagCheckered,
                    color: Colors.grey,
                  ),
                  title: Text(
                    'Country',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () => selectedItem(context, 2),
                ),
              ),

              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // SizedBox(
                      //   height: MediaQuery.of(context).size.height/1.6,
                      // ),
                      Center(
                        child: Text(
                          "Made with ❤ on Flutter",
                          style:
                          TextStyle(color: Colors.grey, fontFamily: 'Montserrat'),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.instagram,
                                color: Colors.white,
                              ),
                              onPressed: () async {
                                String url =
                                    'https://www.instagram.com/__suyashsingh__/';
                                if (await canLaunch(url)) {
                                  await launch(url,
                                      forceSafariVC: true,
                                      forceWebView: true,
                                      enableJavaScript: true);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              }),
                          IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.github,
                                color: Colors.white,
                              ),
                              onPressed: () async {
                                String url = 'https://github.com/suyash-03';
                                if (await canLaunch(url)) {
                                  await launch(url,
                                      forceSafariVC: true,
                                      forceWebView: true,
                                      enableJavaScript: true);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              })
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  void selectedItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.leftToRight, child: HomePage()));
        break;
      case 1:
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.leftToRight, child: GoogleResults()));
        break;
      case 2:
        showDialog(context: context, builder: (BuildContext context){
          return AlertDialog(
           title: Text("Coming Soon"),
          );
        });
        break;
    }
  }
}
