import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'dart:async';
import './MainPage.dart';
import './Details.dart';
import 'SellCrop.dart';
import './Class1.dart';
class GetCurrentURLWebView extends StatefulWidget {
    static String tag = 'webview-page';

    @override
    GetCurrentURLWebViewState createState()  {
      return new GetCurrentURLWebViewState();
    }
  }

  class GetCurrentURLWebViewState extends State<GetCurrentURLWebView> with Class1{
  final flutterWebviewPlugin = new FlutterWebviewPlugin();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  StreamSubscription<String> _onUrlChanged;

  @override
  void initState() {
  super.initState();

  _onUrlChanged = flutterWebviewPlugin.onUrlChanged.listen((String url) {
  if (mounted) {
  print("Current URL: $url");
    if(url != "http://192.168.43.243:8888/getloc") {
      flutterWebviewPlugin.close();
      // starting url = baseurl/getloc
      // changed = baseurl/getloc#{lat:2,lng:5}
      var ll = json.decode(url.replaceAll("%22", "\"").split("#")[1]);
      print(ll);
      Class1.currlat = ll['lat'].toString();
      Class1.currlon = ll['lng'].toString();
      print(Class1.currlat);
      print(Class1.currlon);
      Class1.fetchedloc=url;
      Navigator.pop(context);
    }
  }
  });
  }

  @override
  void dispose() {
  _onUrlChanged.cancel();
  flutterWebviewPlugin.dispose();
  super.dispose();
  }
  @override
  Widget build(BuildContext context) {
  return Container(
  child: WebviewScaffold(url: "http://192.168.43.243:8888/getloc",
  key: scaffoldKey,
  appBar: AppBar(
  title: Text("Set Your Location"),
  ),),
  );
  }
  }

