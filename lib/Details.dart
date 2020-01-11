import 'package:flutter/material.dart';
import './MainPage.dart';
import "package:http/http.dart" as http;
import "dart:convert";
import 'dart:async';
import 'dart:io';
import './SignUp.dart';
import './LoginPage.dart';
import './Class1.dart';
class Details extends StatelessWidget with Class1{
  static String tag = 'detail-page';
  String url = Class1.url;
  String name,username,email;
  final Map<String, dynamic> postdummy = {
    "username": "dev",
    "password": "pass",
    "role": "farmer ",
  };
  void fetch()
  {
    http.post(url + "/api/login", body: postdummy).then((
        http.Response response) {
      final Map<String, dynamic>takeid = json.decode(response.body);
      print(takeid);
      Future<http.Response> fetchpost() async{
        final response1=await http.get(
            url+"api/login",
          headers: {HttpHeaders.authorizationHeader:takeid['token']},
        );
      }
  });

  }
  @override
  Widget build(BuildContext context) {

    final name= Container(
      child: Text(
        "",
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left:25, right:25),
          color: Colors.transparent,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              SizedBox(height: 30.0),

              SizedBox(height: 20.0),

              SizedBox(height: 20.0),

              SizedBox(height: 20.0),

              SizedBox(height: 20.0),

              SizedBox(height: 20.0),

              SizedBox(height: 20.0),

              SizedBox(height: 20.0),

            ],
          ),
        ),
      ),
    );
  }
}
