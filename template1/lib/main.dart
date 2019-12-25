import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:connectivity/connectivity.dart';


import 'country_list_drop_down.dart';
import 'package:toast/toast.dart';
import './items.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(  primarySwatch: Colors.blue, ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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

  _getButtonLauncher(){
    return RaisedButton(
        color: Colors.white24,
        onPressed: _launchURL,
        child: Text('Test Launcher!!'),
      );
  }
_launchURL() async {
  print("clicked");
  await _incrementCounter();
  getImage();
  const url = 'https://flutter.dev';
  if (await canLaunch(url)) {
    Toast.show(" launch $url", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    await launch(url);
  } else {
    Toast.show("Could not launch $url", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
    throw 'Could not launch $url';
  }
}
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }
_incrementCounter() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int counter = (prefs.getInt('counter') ?? 0) + 1;
  print('Pressed $counter times.');
  await prefs.setInt('counter', counter);
}

  _getConnection()async{
       var WConnect;
var connectivityResult = await (Connectivity().checkConnectivity());
if (connectivityResult == ConnectivityResult.mobile) {
  // I am connected to a mobile network.
   WConnect = Text("Mobile");
} else if (connectivityResult == ConnectivityResult.wifi) {
  // I am connected to a wifi network.
   WConnect = Text("WIFi");
}
   return WConnect;
  }

  @override
  Widget build(BuildContext context) {



     return Scaffold(
     
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>
          [
             Padding(padding: EdgeInsets.only(left:10,top:20),child:Row(children: <Widget>[Text("Want Something", style:TextStyle(fontSize: 36, fontWeight: FontWeight.bold))],)),
             Padding(padding: EdgeInsets.only(left:10,top:20),child:Row(children: <Widget>[Text("The wizard", style:TextStyle(fontSize: 28, fontWeight: FontWeight.w400))],)),
             Padding(padding: EdgeInsets.only(left:10,top:30),child: Items()),
             Padding(padding: EdgeInsets.only(left:10,top:30),child: _getButtonLauncher()),

          ]
        ),

      ),
    );
  }
}
