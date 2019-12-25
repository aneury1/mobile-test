


import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  @override
  _ItemsState createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  
  
  Widget _getItemBuilder(context, index){
    return Text("List Item $index",style:TextStyle(color: Colors.white, fontSize: 23));
  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: MediaQuery.of(context).size.width - 20,
      color:Colors.redAccent,
      child:ListView.builder(
      scrollDirection: Axis.horizontal,
      
      itemCount: 45,
      itemBuilder: _getItemBuilder ,
    ));
  }
}