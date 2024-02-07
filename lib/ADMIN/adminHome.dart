import 'package:bookish_beats/ADMIN/viewBookotweek.dart';
import 'package:bookish_beats/ADMIN/viewEvents.dart';
import 'package:bookish_beats/ADMIN/viewProduct.dart';
import 'package:bookish_beats/ADMIN/bookotweek.dart';
import 'package:bookish_beats/ADMIN/viewcategory.dart';
import 'package:bookish_beats/ADMIN/orderList.dart';
import 'package:bookish_beats/ADMIN/userList.dart';
import 'package:bookish_beats/CONSTANT/myFunctions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../PROVIDER/mainProvider.dart';
import '../USER/loginPage.dart';

class adminHome extends StatelessWidget {
  adminHome({super.key});

  List<String> nms=[
    'Book of the week',
   'Add Categories',
    'Add Sub Categories',
    'Best Sellers',
    'View UserList',
    'View order',
    'Add events'
  ];

  @override
  Widget build(BuildContext context) {
    mainProvider provider = Provider.of<mainProvider>(context,listen: false);

    return Scaffold(
      appBar: AppBar(toolbarHeight: 100,
        flexibleSpace: Image.asset('assets/pic3.png',fit: BoxFit.fill,),

        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: (){
            alert(context);
          },
            child: Icon(Icons.logout,color: Colors.white)),
        title: Column(
          children: [
            Text('Bookish Beats',style: TextStyle(fontFamily:'gravitas' ,fontSize: 20,color: Colors.white)),
            Text('Where Book Lovers Belong',style: TextStyle(color:Color(0xff79674e),fontSize: 16 ),)
          ],
        ),


      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

           Padding(
             padding: const EdgeInsets.only(left: 15,top: 10),
             child: Row(
               children: [
                 InkWell(
                   onTap:(){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>viewBookotweek()));

                   },
                   child: Container(
                     width: 150,
                     height: 160,
                     decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter,
                       colors: [Color(0xff3E2704), Color(0xff9B5E02)],),
                       borderRadius: BorderRadius.circular(10),
                       boxShadow:[BoxShadow(color: Color(0xff3E2501),blurRadius:4,
                           blurStyle: BlurStyle.outer, spreadRadius: 5)],



                     ),
                     child: Center(child: Padding(
                       padding: const EdgeInsets.only(left: 8),
                       child: Text('Book of the week',style: TextStyle(fontFamily: 'cantata',color: Colors.white,fontSize: 20)),
                     )),

                   ),
                 ),
                 SizedBox(width: 30),
                 InkWell(onTap: (){
                   provider.getCatgoryData();
                   Navigator.push(context, MaterialPageRoute(builder: (context)=>viewcategory()));

                 },
                   child: Container(
                     width: 150,
                     height: 160,
                     decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter,
                       colors: [Color(0xff3E2704), Color(0xff9B5E02)],),
                       borderRadius: BorderRadius.circular(10),
                       boxShadow:[BoxShadow(color: Color(0xff3E2501),blurRadius:4,
                           blurStyle: BlurStyle.outer, spreadRadius: 5)],



                     ),
                     child: Center(child: Padding(
                       padding: const EdgeInsets.only(left: 8),
                       child: Text('Add Categories',style: TextStyle(fontFamily: 'cantata',color: Colors.white,fontSize: 20)),
                     )),

                   ),
                 ),
               ],
             ),

           ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: Row(
                children: [
                  InkWell(
                    onTap:(){
                      provider.getBookDetails();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>viewProduct()));

                    },
                    child: Container(
                      width: 150,
                      height: 160,
                      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter,
                        colors: [Color(0xff3E2704), Color(0xff9B5E02)],),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:[BoxShadow(color: Color(0xff3E2501),blurRadius:4,
                            blurStyle: BlurStyle.outer, spreadRadius: 5)],



                      ),
                      child: Center(child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text('View Product',style: TextStyle(fontFamily: 'cantata',color: Colors.white,fontSize: 20)),
                      )),

                    ),
                  ),
                  SizedBox(width: 30),
                  InkWell(
                    onTap: (){
                      // callNext(context, viewBookotweek());
                    },
                    child: Container(
                      width: 150,
                      height: 160,
                      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter,
                        colors: [Color(0xff3E2704), Color(0xff9B5E02)],),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:[BoxShadow(color: Color(0xff3E2501),blurRadius:4,
                            blurStyle: BlurStyle.outer, spreadRadius: 5)],



                      ),
                      child: Center(child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text('Best Sellers',style: TextStyle(fontFamily: 'cantata',color: Colors.white,fontSize: 20)),
                      )),

                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: Row(
                children: [
                  InkWell(onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>userList()));

                  },
                    child: Container(
                      width: 150,
                      height: 160,
                      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter,
                        colors: [Color(0xff3E2704), Color(0xff9B5E02)],),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:[BoxShadow(color: Color(0xff3E2501),blurRadius:4,
                            blurStyle: BlurStyle.outer, spreadRadius: 5)],



                      ),
                      child: Center(child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text('View UserList',style: TextStyle(fontFamily: 'cantata',color: Colors.white,fontSize: 20)),
                      )),

                    ),
                  ),
                  SizedBox(width: 30),
                  InkWell(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>orderList()));

                  },
                    child: Container(
                      width: 150,
                      height: 160,
                      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter,
                        colors: [Color(0xff3E2704), Color(0xff9B5E02)],),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:[BoxShadow(color:Color(0xff3E2501),blurRadius:4,
                            blurStyle: BlurStyle.outer, spreadRadius: 5)],



                      ),
                      child: Center(child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text('View order',style: TextStyle(fontFamily: 'cantata',color: Colors.white,fontSize: 20)),
                      )),

                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left: 15,top: 10),
              child: Row(
                children: [
                  InkWell(onTap:(){
                    provider.getEvents();
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>viewEvents()));
            },
                    child: Container(
                      width: 150,
                      height: 160,
                      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter,
                        colors: [Color(0xff3E2704), Color(0xff9B5E02)],),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:[BoxShadow(color: Color(0xff3E2501),blurRadius:4,
                            blurStyle: BlurStyle.outer, spreadRadius: 5)],



                      ),
                      child: Center(child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text('Add events',style: TextStyle(fontFamily: 'cantata',color: Colors.white,fontSize: 20)),
                      )),

                    ),
                  ),
                  SizedBox(width: 30),
                  // Container(
                  //   width: 150,
                  //   height: 160,
                  //   decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter,
                  //     colors: [Color(0xff3E2704), Color(0xff9B5E02)],),
                  //     borderRadius: BorderRadius.circular(10),
                  //     boxShadow:[BoxShadow(color:Color(0xff3E2501),blurRadius:4,
                  //         blurStyle: BlurStyle.outer, spreadRadius: 5)],
                  //
                  //
                  //
                  //   ),
                  //   child: Center(child: Padding(
                  //     padding: const EdgeInsets.only(left: 8),
                  //     child: Text('View order',style: TextStyle(fontFamily: 'cantata',color: Colors.white,fontSize: 20)),
                  //   )),
                  //
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  alert(BuildContext context){
    showDialog(context: context, builder: (ctx)=>AlertDialog(
      title: Text("Log Out"),
      content: Text("Are you sure ?"),
      actions: <Widget>[
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Container(
          height: 40,
          width: 65,
          decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(12)
          ),
          child: Center(child: Text("No",style: TextStyle(color: Colors.white),)),
        )),
        TextButton(onPressed: (){
          FirebaseAuth auth=FirebaseAuth.instance;
          auth.signOut();
          print("hellooo");
          // callNextReplacement(context, login());
          //
          //
          // // callNextReplacement(context, login());
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => loginPage()),
                (Route<dynamic> route) => false,
          );
        }, child: Container(
          height: 40,
          width: 65,
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xff3E2501),
          ),
          child: Center(child: Text("Yes",style: TextStyle(color: Colors.white),)),
        )),

      ],

    ));

  }

}
