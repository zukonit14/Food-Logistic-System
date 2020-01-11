import 'package:flutter/material.dart';
import './MainPage.dart';
import "package:http/http.dart" as http;
import "dart:convert";
import 'dart:async';
import './Details.dart';
import 'dart:io';
import 'Class1.dart';
import 'SellCrop.dart';
import './User.dart';
class SignUp extends StatefulWidget {
  static String tag = 'signup-page';
  @override
  _SignUpPageState createState() => new _SignUpPageState();
}

class _SignUpPageState extends State<SignUp> with Class1{
  String url = Class1.url;
  TextEditingController usernamec = new TextEditingController();
  TextEditingController passwordc = new TextEditingController();
  TextEditingController firstnamec = new TextEditingController();
  TextEditingController lastnamec = new TextEditingController();
  TextEditingController confirmpasswordc = new TextEditingController();
  TextEditingController aadharcardc = new TextEditingController();
  TextEditingController emailc = new TextEditingController();

  void loginValid() {
    final Map<String, dynamic> postdummy = {
      "username": usernamec.text,//"dev",
      "password": passwordc.text,//"pass",
      "role": "farmer",
      "mobileNo": emailc.text,
      "name": firstnamec.text+" "+lastnamec.text
    };
    final Map<String,dynamic> postlogindummy={
      "username":usernamec.text,
      "password":passwordc.text,
      "role":"farmer"
    };
     http.post(url+"/api/register",body: postdummy).then((http.Response response) {
      final Map<String, dynamic>takestatus = json.decode(response.body);
      http.post(url + "/api/login", body: postlogindummy).then((
          http.Response response) {
        final Map<String, dynamic>takeid = json.decode(response.body);
        print(takestatus);
        print(takeid);
        http.get(url+"/api/check",headers: {HttpHeaders.authorizationHeader: "bearer "+takeid['token']}).
        then<Null>((http.Response response1){
          final Map<String,dynamic> takeid1 = json.decode(response1.body);
          print("take1" + takeid1['user'].toString());
          takeid['token'];
          Class1.token = takeid['token'];

        });
        //print(takeid['token']);
        //SellCrop s1=SellCrop(takeid['token']);
        //Navigator.push(context,MaterialPageRoute(builder: (context)=>SellCrop(takeid['token'])));
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    final email = TextFormField(
      controller: emailc,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      //initialValue: 'zukonit14@gmail.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
    );

    final firstname = TextFormField(
      controller: firstnamec,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      //initialValue: 'zukonit14@gmail.com',
      decoration: InputDecoration(
        hintText: 'First Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
    );
    final lastname = TextFormField(
      controller: lastnamec,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      //initialValue: 'zukonit14@gmail.com',
      decoration: InputDecoration(
        hintText: 'Last Name',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
    );
    final aadharcard = TextFormField(
      controller: aadharcardc,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      //initialValue: 'zukonit14@gmail.com',
      decoration: InputDecoration(
        hintText: 'Aadhar Card Number',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
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
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
    );

    final confirmpassword = TextFormField(
      controller: confirmpasswordc,
      autofocus: false,
      //initialValue: 'some password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Confirm Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
    );
    final username = TextFormField(
      controller: usernamec,
      autofocus: false,
      //initialValue: 'some password',
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
      ),
    );
    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          loginValid();
          Navigator.of(context).pushNamed(SellCrop.tag);
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        elevation: 10,
        child: Text('Sign Up', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp Page"),
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
              firstname,
              SizedBox(height: 20.0),
              lastname,
              SizedBox(height: 20.0),
              aadharcard,
              SizedBox(height: 20.0),
              username,
              SizedBox(height: 20.0),
              email,
              SizedBox(height: 20.0),
              password,
              SizedBox(height: 20.0),
              confirmpassword,
              SizedBox(height: 20.0),
              loginButton,
            ],
          ),
        ),
      ),
    );
  }
}
