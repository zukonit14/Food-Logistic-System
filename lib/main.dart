import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'MainPage.dart';
import 'SignUp.dart';
import './Details.dart';
import './SellCrop.dart';
import './Webview.dart';
import './Successsell.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    SignUp.tag: (context) => SignUp(),
    MainPage.tag: (context) => MainPage(),
    Details.tag: (context) => Details(),
    SellCrop.tag: (context) => SellCrop(),
    GetCurrentURLWebView.tag: (context) => GetCurrentURLWebView(),
    Successsell.tag: (context) => Successsell(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tres_Comas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito',
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}