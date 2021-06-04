import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_bytes/api_requests/top_headlines.dart';
import 'package:page_transition/page_transition.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Screens/about_page.dart';
import 'Screens/categories_types.dart';

class NavigationDrawerWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.black,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                leading: FaIcon(FontAwesomeIcons.carSide,color: Colors.grey,),
                title: Text('about',
                style: TextStyle(
                  color: Colors.white
                ),),
                onTap: () => selectedItem(context,0),
              ),
            ),
            Divider(color: Colors.grey,),
            SizedBox(height: MediaQuery.of(context).size.height/1.5,),
            Center(
              child: Text("Made with Flutter by Suyash Singh",
              style: TextStyle(
                color: Colors.grey,
                fontFamily: 'Montserrat'
              ),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: FaIcon(FontAwesomeIcons.instagram,color: Colors.white,),
                    onPressed: ()async{
                      String url = 'https://www.instagram.com/__suyashsingh__/';
                      if (await canLaunch(url)) {
                        await launch(url,
                            forceSafariVC: true,
                            forceWebView: true,
                            enableJavaScript: true);
                      } else {
                        throw 'Could not launch $url';
                      }

                    }),
                IconButton(icon: FaIcon(FontAwesomeIcons.github,color: Colors.white,),
                    onPressed: () async{
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
            )
          ],
        )
        ),
      );
  }
  void selectedItem(BuildContext context, int index){
    switch(index){
      case 0:
        Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: AboutPage()));
        break;
      // case 1:
      //   Navigator.of(context).push(MaterialPageRoute(
      //       builder: (context)=>AboutPage()));
      //   break;
    }
  }

}