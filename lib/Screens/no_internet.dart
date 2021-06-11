import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import '../shared/connectivity.dart';
import 'package:provider/provider.dart';

class NoInternet extends StatefulWidget {
  const NoInternet({Key key}) : super(key: key);

  @override
  _NoInternetState createState() => _NoInternetState();
}

class _NoInternetState extends State<NoInternet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: 200,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height/3.5,),
            Text("No Internet",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
            SizedBox(height: 20,),
            Text("Connect to Internet and restart the Application",
              style: TextStyle(
                  color: Colors.grey,
                  fontFamily: 'Montserrat'
              ),),
            SizedBox(height: 40,),
            ZoomIn(
              child: FlatButton(
                onPressed: () async{
                  final connectionProvider = Provider.of<ConnectivityStatus>(context,listen: false);
                  connectionProvider.checkConnectivity();
                  print("Button Press");
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  height: 50,
                  width: 150,
                  child: Center(child: Text("Try Again",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'
                    ),),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
