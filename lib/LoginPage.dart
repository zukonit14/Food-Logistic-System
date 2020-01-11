import 'package:flutter/material.dart';
import './MainPage.dart';
import "package:http/http.dart" as http;
import "dart:convert";
import 'dart:async';
import "./SignUp.dart";
import './MainPage.dart';
import './SellCrop.dart';
import './Class1.dart';
class LoginPage extends StatelessWidget with Class1{
  static String tag = 'login-page';
  String url = Class1.url;
  String invalidstatus="";
  TextEditingController usernamec = new TextEditingController();
  TextEditingController passwordc = new TextEditingController();

  void loginValid() {
    final Map<String, dynamic> postdummy = {
      "username": "dev",
      "password": "pass",
      "role": "farmer",
    };
    http.post(url+"/api/login",body: postdummy).then((http.Response response){
       final Map<String,dynamic>takeid=json.decode(response.body);
      print(takeid);
      print(takeid['token']);
      Class1.token=takeid['token'];
//      bool hasError=true;
////      if(takeid.containsKey('token'))
////        hasError=false;
////      if(hasError==false)
////        {
////          Navigator.of(context).pushNamed(MainPage.tag);
////        }
////      else
////        {
////          setState(() {
////            invalidstatus="Invalid Credentials";
////          });
////        }
     });
  }
    @override
    Widget build(BuildContext context) {
      final logo =
      Center(
        child: Text(
          "FARMER'S PORTAL",style: TextStyle(fontSize: 30,color:Colors.green),
        ),
      );
      final invalidcreds=Center(
        child: Text(invalidstatus,style: TextStyle(color: Colors.red),),
      );
      final email = TextFormField(
        controller: usernamec,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        //initialValue: 'zukonit14@gmail.com',
        decoration: InputDecoration(
          hintText: 'Email',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      );

      final password = TextFormField(
        controller: passwordc,
        autofocus: false,
        //initialValue: 'some password',
        obscureText: true,
        decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        ),
      );

      final loginButton = Padding(
        padding: EdgeInsets.only(top: 0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          onPressed: () {
            loginValid();
            Navigator.of(context).pushNamed(MainPage.tag);
          },
          padding: EdgeInsets.all(12),
          color: Colors.lightBlueAccent,
          elevation: 10,
          child: Text('Log In', style: TextStyle(color: Colors.white)),
        ),
      );
      final signupButton = Padding(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(SignUp.tag);
          },
          padding: EdgeInsets.all(12),
          color: Colors.lightBlueAccent,
          elevation: 10,
          child: Text('Sign Up', style: TextStyle(color: Colors.white)),
        ),
      );
      final forgotLabel = FlatButton(
        child: Text(
          'Forgot password?',
          style: TextStyle(color: Colors.black54),
        ),
        onPressed: () {},
      );
      return Scaffold(
        appBar: AppBar(
          title: Text("Login Page",),
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
                SizedBox(height: 30,),
                logo,
                SizedBox(height: 70.0),
                email,
                SizedBox(height: 15.0),
                password,
                SizedBox(height: 12.0),
                invalidcreds,
                SizedBox(height: 12.0,),
                loginButton,
                signupButton,
                forgotLabel
              ],
            ),
          ),
        ),
      );
    }
  }
