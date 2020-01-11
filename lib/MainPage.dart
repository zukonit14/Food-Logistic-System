import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import "dart:convert";
import './Class1.dart';
import './SellCrop.dart';
import './Webview.dart';
class MainPage extends StatelessWidget with Class1 {
  static String tag = 'main-page';
  //String url="http://192.168.43.29:8888";
  String url=Class1.url;


  @override
  Widget build(BuildContext context) {
    final btn1 =
    Container(
      color: Colors.transparent,
        child:Padding(padding: EdgeInsets.all(16),

          child:ButtonTheme(
            height: 70,
            child: RaisedButton(
              onPressed:
            (){
                Navigator.of(context).pushNamed(SellCrop.tag);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 20,
              color: Colors.blue,
              child: Row(
                children: <Widget>[
                  Text("SELL CROPS",style: TextStyle(backgroundColor: Colors.transparent,color: Colors.white,fontSize: 20),),
                  SizedBox(width: 10.0,),
                  Text(""),
                ],
              ),
            ),
          ),
        )
    );
    final btn2=Container(
        color: Colors.transparent,
        child:Padding(padding: EdgeInsets.all(16),
          child:ButtonTheme(
            height: 70,
            child: RaisedButton(onPressed: (){},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 20,
              color: Colors.blue,
              child: Row(
                children: <Widget>[
                  Text("SUGGESSIONS",style: TextStyle(backgroundColor: Colors.transparent,color: Colors.white,fontSize: 20),),
                  SizedBox(width: 10.0,),
                  Text(""),
                ],
              ),
            ),
          ),
        )
    );
    final btn3=Container(
        color: Colors.transparent,
        child:Padding(padding: EdgeInsets.all(16),
          child:ButtonTheme(
            height: 70,
            child: RaisedButton(onPressed: (){},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 20,
              color: Colors.blue,
              child: Row(
                children: <Widget>[
                  Text("ORDER HISTORY",style: TextStyle(backgroundColor: Colors.transparent,color: Colors.white,fontSize: 20),),
                  SizedBox(width: 10.0,),
                  Text(""),
                ],
              ),
            ),
          ),
        )
    );
    final btn4 = Container(
        color: Colors.transparent,
        child:Padding(padding: EdgeInsets.all(16),
          child:ButtonTheme(
            height: 70,
            child: RaisedButton(onPressed: (){},
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 20,
              color: Colors.blue,
              child: Row(
                children: <Widget>[
                  Text("PAYMENT STATUS",style: TextStyle(backgroundColor: Colors.transparent,color: Colors.white,fontSize: 20),),
                  SizedBox(width: 10.0,),
                  Text(""),
                ],
              ),
            ),
          ),
        )
    );
    return (
        Scaffold(
          appBar: AppBar(
            title: Text("Main Page"),
          ),
          body:

          Center(
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                btn1,
                SizedBox(height: 7,),
              btn2,
              SizedBox(height: 7,),
              btn3,
              SizedBox(height: 7,),
              btn4,
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(onPressed: null,
          child: Icon(Icons.chat,color: Colors.white,),

          backgroundColor: Colors.blue,),
        )
    );
  }
}
