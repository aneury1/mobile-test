
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:camera/camera.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';

 
class CameraApp extends StatefulWidget {  

  CameraDescription camera;
  CameraApp({@required this.camera});
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {

  @override
  Widget build(BuildContext context) {
   
        return 
        ////_getCameraPreview(context);////
        Expanded(child:Container(color:Colors.black));
  }
}