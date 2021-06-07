import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityStatus extends ChangeNotifier{
  int connectionStatus;
  checkConnectivity() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if(connectivityResult ==  ConnectivityResult.none) {
      connectionStatus = 0;
      notifyListeners();
    }
    else{
      connectionStatus = 1;
      notifyListeners();
    }
  }
}