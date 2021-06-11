import 'package:flutter/material.dart';
import 'package:news_bytes/Screens/home_screen.dart';
import 'package:news_bytes/Screens/no_internet.dart';
import 'package:news_bytes/shared/connectivity.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() async{
    super.didChangeDependencies();
    final connectionProvider = Provider.of<ConnectivityStatus>(context);
    connectionProvider.checkConnectivity();
  }
  @override
  Widget build(BuildContext context) {
    final connectionProvider = Provider.of<ConnectivityStatus>(context);
    if (connectionProvider.connectionStatus == 0) {
      //No Internet
      return NoInternet();
    } else {
      //has internet
      return HomePage();
    }
  }
}
