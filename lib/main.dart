
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import './check.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Otp Sender',
      theme: ThemeData(
       
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter OTP Sender'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final TextEditingController _userController = new TextEditingController();
  
Future<List> _search() async {
    String nums = _userController.text;//Your php file address

    if(nums.isEmpty){
      print("Wrong number");
    }else{
        var rng = new Random();
        var next = rng.nextDouble() * 1000000;
        while (next < 100000) {
          next *= 10;
        }
      var apiUrl = 'http://192.168.182.1/flutter/sms-github.php';
      int number = int.parse(nums);
      super.initState();
      http.post(apiUrl, body: {
        "otp": next.toString(),
        "number": nums,
      });
       Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Check(
                    user_number: nums,
                    otp: next.toInt(),
                  ),
            ));
    }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'OTP Sender App',
            ),
            TextField(
              controller: _userController,
              decoration: new InputDecoration(
              hintText: "User Number",
              icon: new Icon(Icons.contact_phone),
              )
            ),
            new RaisedButton(
            onPressed: _search,
            textColor: Colors.white,
            color: Colors.blue[300],
            child: Text("Send OTP"),
            ),
          ],
        ),
      ),
    );
  }
}
