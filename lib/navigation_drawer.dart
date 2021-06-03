import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

import 'Screens/about_page.dart';
import 'Screens/categories.dart';

class NavigationDrawerWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white54,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListTile(
                leading: FaIcon(FontAwesomeIcons.carSide),
                title: Text('about'),
                onTap: () => selectedItem(context,0),
              ),
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