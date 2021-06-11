import 'package:flutter/material.dart';
import 'package:news_bytes/Screens/home_screen.dart';
import 'package:news_bytes/api_requests/google_headlines.dart';
import 'package:news_bytes/api_requests/search_headlines.dart';
import 'package:news_bytes/api_requests/top_headlines.dart';
import 'package:news_bytes/shared/connectivity.dart';
import 'package:news_bytes/shared/wrapper.dart';
import 'package:provider/provider.dart';
import 'api_requests/category_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => TopHeadlines(),
        ),
        Provider(
          create: (context) => CategoryList(),
        ),
        Provider(
          create: (context) => SearchList(),
        ),
        Provider(
          create: (context) => GoogleList(),
        ),
        ChangeNotifierProvider(create: (context) => ConnectivityStatus())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}
