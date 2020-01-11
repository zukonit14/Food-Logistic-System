import 'package:flutter/material.dart';
import './Class1.dart';

class Successsell extends StatelessWidget with Class1{
  static String tag = 'successsell-page';
  @override
  Widget build(BuildContext context) {
    final sellid=
        Center(
          child: Text(
            "SUCCESS",style: TextStyle(fontSize: 40,color: Colors.green),),
        );
    final cropname=
    Center(
      child: Text(
          "Crop Name : " +Class1.cropname,style: TextStyle(fontSize: 20),),
    );
    final weight=
    Center(
      child: Text(
          "Weight : " +Class1.weight,style: TextStyle(fontSize: 20),),
    );
    final price=
    Center(
      child: Text(
          "Price : " + Class1.price,style: TextStyle(fontSize: 20),),
    );
    final BackButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        elevation: 10,
        child: Text('Back', style: TextStyle(color: Colors.white)),
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
              SizedBox(height: 40.0),
              sellid,
              SizedBox(height: 30.0,),
            cropname,
            SizedBox(height: 25.0,),
            weight,
            SizedBox(height: 25.0,),
            price,
            SizedBox(height: 25.0,),
              BackButton,
          SizedBox(height: 40.0,)
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
