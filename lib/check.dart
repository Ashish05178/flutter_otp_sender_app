import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class Check extends StatefulWidget {
  final int otp;
  final String user_number;
   Check(
      {Key key,
      @required this.user_number,this.otp})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Checkstate();
  }
}

class Checkstate extends State<Check > {
  final TextEditingController _otpnumber = new TextEditingController();

void _check(){
String optnumber=_otpnumber.text;
if(optnumber.isEmpty){
  print("Enter the Otp");
}else{
  if(optnumber==widget.otp){
    print("Successfull check");
  }else{
    print("Fail");
  }
}
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Otp Sender"),
      ),
      body: Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'OTP Sender App',
            ),
            TextField(
              controller: _otpnumber ,
              decoration: new InputDecoration(
              hintText: "Enter the OTP",
              icon: new Icon(Icons.confirmation_number),
              )
            ),
            new RaisedButton(
            onPressed: _check,
            textColor: Colors.white,
            color: Colors.blue[300],
            child: Text("Cehck"),
            ),
          ],
        ),
      ),
    );
  }
}
