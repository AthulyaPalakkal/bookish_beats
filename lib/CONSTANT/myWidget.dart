
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget otpcont(){
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xff3E2501)),
    child: TextField(
      keyboardType: TextInputType.phone,
      inputFormatters: [LengthLimitingTextInputFormatter(1)],
      decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    ),
  );
}

Widget srchbr(){
  return Container(
    width: 290,height: 40,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Color(0xffd4d4d3)),
    child: TextField(
      decoration: InputDecoration(
        hintText: 'Search here',hintStyle:TextStyle(color: Colors.black26) ,
          prefixIcon:  Icon(Icons.search_rounded,color: Color(0xff3E2501)),
         border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),),
    ),
  );
}
Widget usernms(){
  return Container(
    width: 290,
    height: 40,
    decoration:BoxDecoration(color: Color(0xff4b3a1f),) ,
  );

}
