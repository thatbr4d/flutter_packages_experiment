import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';

class ConnectionService implements Disposable {
  late StreamSubscription<ConnectivityResult> _subscription;

  ConnectionService() {
    _subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      debugPrint("Connection Status changed");
      // call other service here and do something
      // need to figure out how to make this work globally, it works if I put it in an initState
    });
  }

  Future<bool> isConnected() async {
    var result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }

  @override
  FutureOr onDispose() {
    _subscription.cancel();
  }
}
