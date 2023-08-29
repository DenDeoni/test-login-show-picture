import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> isInetConnect() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  return (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi ||
      connectivityResult == ConnectivityResult.vpn || connectivityResult == ConnectivityResult.ethernet);
}
