import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'camera_app.dart';

List<CameraDescription> cameras;

Future<void>  main() async{ 
  WidgetsFlutterBinding.ensureInitialized();
   cameras = await availableCameras();
   runApp( MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      body: Center(
        child: Stack(
          children: <Widget>[
             Column(
               children: <Widget>[
                  CameraApp( camera: cameras.first, )
               ],
             ),
             Positioned(top:10,left:1,child: _getTopOptions(context),),
             Positioned(bottom:80,right:20,child: _getUserButtons(context),),
             Positioned(bottom:10 ,child:_getBottomBar(context)),
             Positioned(bottom:80, left:0, child: Row( mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[ _getUserMusicAndName(context)],) ),
          ],
        ),
      ),
    );
  }


   _getTopOptions(conext){
    
     return
        (
         Container(
           height: 100,
           width: MediaQuery.of(context).size.width,
           color: Colors.transparent,
           child:
             
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   Padding( padding:EdgeInsets.all(5),child: Text("For You", style:TextStyle(fontSize: 19, color:Colors.white, fontWeight: FontWeight.bold)),),
                   Padding( padding:EdgeInsets.all(5),child: Text("Following", style:TextStyle(fontSize: 19,color:Colors.white60)),)
                ],
             
             ),
     ));
   }

   _getUserAvatar(context){
     return CircleAvatar( radius: 25.0, child: Icon(Icons.verified_user, size: 32,),);
   }
   _getUserLikes(context){
     return 
      Column(
       children: <Widget>[
            CircleAvatar( radius: 24.0, child: Icon(Icons.star, size: 32,),),
            Text("21.4k", style: TextStyle(fontSize: 16, color:Colors.white70),)
       ]
     );
   }
   _getUserMessage(context){
     return 
      Column(
       children: <Widget>[
            CircleAvatar( radius: 24.0, child: Icon(Icons.message, size: 32,),),
            Text("214", style: TextStyle(fontSize: 16, color:Colors.white70),)
       ]
     );
   }

   _getShareOption(context){
     return 
      Column(
       children: <Widget>[
            CircleAvatar( radius: 24.0, child: Icon(Icons.share, size: 32,),),
            Text("share", style: TextStyle(fontSize: 16, color:Colors.white70),)
       ]
     );
   }

   _getCurrentUserProfile(context){
     return 
      Column(
       children: <Widget>[
            CircleAvatar( radius: 24.0, child: Icon(Icons.person, size: 32,),),
           /// Text("21.4k", style: TextStyle(fontSize: 16, color:Colors.white70),)
       ]
     );
   }

   _getUserButtons(context){
    
      return(Column(
         children: <Widget>[
            SizedBox(height: 20,),
            Padding(padding: EdgeInsets.only(top:5, bottom: 10),child: _getUserAvatar(context) ,),
            Padding(padding: EdgeInsets.only(top:5, bottom: 5),child:  _getUserLikes(context),),
            Padding(padding: EdgeInsets.only(top:5, bottom: 5),child:  _getUserMessage(context),),
            Padding(padding: EdgeInsets.only(top:5, bottom: 5),child:  _getShareOption(context),),
            SizedBox(height: 20,),
            Padding(padding: EdgeInsets.only(top:15, bottom: 5),child: _getCurrentUserProfile(context),),
         ],
      )
      );
   }


    _getBottomBar(context){
       return(Container(
           width: MediaQuery.of(context).size.width,
           height: 64,
           decoration: 
           BoxDecoration(border: Border( top: BorderSide(width: 1.0, color: Colors.white54),),
           color: Colors.transparent,
           ),
           child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _getHomePageButton(context),
                _getSearchButton(context),
                _getAddButton(context),
                _getThunderButton(context),
                _getProfileButton(context)
              ],
           ),
          
           )
       );
    } 


    _getHomePageButton(context){
      return Icon(Icons.home, color: Colors.white, size: 34,);
    }
    _getSearchButton(context){
      return Icon(Icons.search, color: Colors.white, size: 34,);
    }

    _getThunderButton(context){
      return Icon(Icons.power, color: Colors.white, size: 34,);
    }
    _getProfileButton(context){
      return Icon(Icons.supervisor_account, color: Colors.white, size: 34,);
    }

    _getAddButton(context){

       return 
       Container(
       decoration: BoxDecoration(borderRadius: BorderRadius.circular(34),),
      
       width:48,
       height: 48,
       child:Stack(
         children: <Widget>[
             Center(child: Container(width:42,height: 47, color:Colors.white, child:Center(child: Text("+", style:TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),)),),
             Positioned(left:1, child: Container(width:3,height: 47,color:Colors.greenAccent),),
             Positioned(right:1, child: Container(width:3,height: 47,color:Colors.redAccent),),
         ],
         )
       );


    }

   _getUserMusicAndName(context){

     return Container(
          width: MediaQuery.of(context).size.width - 100,
          height: 100.0,
          child: Column(
            children: <Widget>
            [
                Text("@alexandrachapi", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23, color:Colors.white,)),
                Text("Esta es una prueba pendeja...."),
                Text("Raulin rodriguez.....")
            ],
            ),
        );


   }




}
