import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import './Webview.dart';
import './Successsell.dart';
//import 'package:geolocator/geolocator.dart';
//import 'package:flutter_map/flutter_map.dart';
import './SignUp.dart';
import './Class1.dart';

class SellCrop extends StatelessWidget with Class1 {

  static String tag = 'sellcrop-page';
  static String url = Class1.url;

  static TextEditingController cropc = new TextEditingController();
  static TextEditingController weightc = new TextEditingController();
  static TextEditingController latitudec = new TextEditingController();
  static TextEditingController longitudec = new TextEditingController();
  static TextEditingController pricec = new TextEditingController();
//  static MapController controller1 = new MapController();

  static void postcrop() {
    final Map<String, dynamic> postdummy = {
      "cropname": cropc.text,
      "weight": weightc.text,
      "price":pricec.text,
      "location_lat": Class1.currlat,
      "location_lon": Class1.currlon
    };
    Class1.cropname=cropc.text;
    Class1.weight=weightc.text;
    Class1.price=pricec.text;
    //print(SignUp.tokenidtosend);
    print("TOKEN is "+Class1.token);
    http.post(url+"/api/farmer/sell",body: postdummy,headers: {HttpHeaders.authorizationHeader: "bearer " + Class1.token}).then((http.Response response){
      final Map<String,dynamic>takeid=json.decode(response.body);
      print(takeid['sellId']);
      Class1.sellid=takeid['sellId'];
    });
  }

  final weight = TextFormField(
    controller: weightc,
    autofocus: false,
    //initialValue: 'some password',
    decoration: InputDecoration(
      hintText: 'Weight',
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
    ),
  );

  final longitude = TextFormField(
    controller: longitudec,
    autofocus: false,
    //initialValue: 'some password',
    decoration: InputDecoration(
      hintText: 'Longitude',
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
    ),
  );
  final latitude = TextFormField(
    controller: latitudec,
    autofocus: false,
    //initialValue: 'some password',
    decoration: InputDecoration(
      hintText: 'Latitute',
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
    ),
  );
  final price = TextFormField(
    controller: pricec,
    autofocus: false,
    //initialValue: 'some password',
    decoration: InputDecoration(
      hintText: 'Price',
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
    ),
  );
  final crop = TextFormField(
    controller: cropc,
    autofocus: false,
    //initialValue: 'some password',
    decoration: InputDecoration(
      hintText: 'Crop Name',
      contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
    ),
  );




  @override
  Widget build(BuildContext context) {
    final sendButton = Padding(
      padding: EdgeInsets.only(top: 0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          postcrop();
          Navigator.of(context).pushNamed(Successsell.tag);
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        elevation: 10,
        child: Text('Post', style: TextStyle(color: Colors.white)),
      ),
    );
    final locationButton = Padding(
      padding: EdgeInsets.only(right: 20,left: 20),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed(GetCurrentURLWebView.tag);
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        elevation: 10,
        child: Text("Select your Location", style: TextStyle(color: Colors.white)),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Sell Crop"),
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
              crop,
              SizedBox(height: 20.0),
              weight,
              SizedBox(height: 20.0),
              price,
              SizedBox(height: 20.0),
//              latitude,
//              SizedBox(height: 20.0),
//              longitude,
//              SizedBox(height: 20.0,),
              locationButton,
              SizedBox(height: 20.0,),
              sendButton,
              SizedBox(height: 20.0,)
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: null,
        child: Icon(Icons.chat,color: Colors.white,),

        backgroundColor: Colors.blue,),
    );
  }
}
