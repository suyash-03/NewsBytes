import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_bytes/Screens/home_screen.dart';
import 'package:news_bytes/api_requests/top_headlines.dart';
import 'package:provider/provider.dart';

import 'api_requests/category_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MultiProvider(
      providers: [
        ListenableProvider(
        create: (context)=> TopHeadlines(),
        ),
        ListenableProvider(
          create: (context)=> CategoryList(),
        )


      ],
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

