import 'package:bookish_beats/ADMIN/bookotweek.dart';
import 'package:bookish_beats/CONSTANT/myFunctions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../PROVIDER/mainProvider.dart';

class viewBookotweek extends StatelessWidget {
  viewBookotweek({super.key});

  @override
  Widget build(BuildContext context) {
    mainProvider provider = Provider.of<mainProvider>(context,listen: false);

    return SafeArea(child: Scaffold(
      floatingActionButton:  FloatingActionButton(shape: CircleBorder(),
        backgroundColor: Color(0xff3E2501),
        onPressed: () {
          provider.clearcategoryname();

          Navigator.push(context, MaterialPageRoute(builder: (context)=>bookotweek()));

        },
        child: Icon(Icons.add,color: Colors.white),
      ),

      appBar: AppBar(toolbarHeight: 60,
        flexibleSpace: Image.asset('assets/pic3.png',fit: BoxFit.fill,),
        bottom: PreferredSize(preferredSize: Size.fromHeight(3),
          child:Padding(
            padding: const EdgeInsets.only(bottom: 10),

          ),

        ),
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: (){
              back(context)  ;
            },
            child: Icon(Icons.arrow_back,color: Colors.white)),
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text('Add book of \n  the week',style: TextStyle(fontFamily:'gravitas' ,fontSize: 20,color: Colors.white)),
        ),


      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Center(
            child: Container(
              height: 170,
              width: 260,
              decoration: BoxDecoration(gradient: LinearGradient(
                  colors: [Color(0xff3d2603), Color(0xff9b5e01), Color(0xffff9800)]),
                  borderRadius: BorderRadius.circular(20)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10,top: 20),
                child: Row(
                  children: [
                    Column(
                      children: [
                        SizedBox(height: 4,),
                        Text("   Book of \n  the week",style: TextStyle(fontFamily: 'cantata',
                            color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),),
                        ElevatedButton(

                            style:ElevatedButton.styleFrom(
                                backgroundColor:Color(0xffd1ad76),
                                elevation:5,
                                minimumSize: Size(70, 30)
                              // fixedSize:Size(110,6)
                            ),

                            onPressed:(){

                            } ,
                            child: Text("view Details",style: TextStyle(fontSize: 14,color: Colors.black,fontFamily: 'cantata'),)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,bottom: 20),
                      child: Image(image: AssetImage('assets/book1.jpg'),height: 100,width: 100,),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10,),
           Container(
            height: 170,
            width: 260,
            decoration: BoxDecoration(gradient: LinearGradient(
                colors: [Color(0xff3d2603), Color(0xff9b5e01), Color(0xffff9800)]),
                borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10,top: 20),
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 4,),
                      Text("   Book of \n  the week",style: TextStyle(fontFamily: 'cantata',
                          color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),),
                      ElevatedButton(

                          style:ElevatedButton.styleFrom(
                              backgroundColor:Color(0xffd1ad76),
                              elevation:5,
                              minimumSize: Size(70, 30)
                            // fixedSize:Size(110,6)
                          ),

                          onPressed:(){

                          } ,
                          child: Text("view Details",style: TextStyle(fontSize: 14,color: Colors.black,fontFamily: 'cantata'),)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,bottom: 20),
                    child: Image(image: AssetImage('assets/book1.jpg'),height: 100,width: 100,),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            height: 170,
            width: 260,
            decoration: BoxDecoration(gradient: LinearGradient(
                colors: [Color(0xff3d2603), Color(0xff9b5e01), Color(0xffff9800)]),
                borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10,top: 20),
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 4,),
                      Text("   Book of \n  the week",style: TextStyle(fontFamily: 'cantata',
                          color: Colors.white,fontSize: 20,fontWeight: FontWeight.w400),),
                      ElevatedButton(

                          style:ElevatedButton.styleFrom(
                              backgroundColor:Color(0xffd1ad76),
                              elevation:5,
                              minimumSize: Size(70, 30)
                            // fixedSize:Size(110,6)
                          ),

                          onPressed:(){

                          } ,
                          child: Text("view Details",style: TextStyle(fontSize: 14,color: Colors.black,fontFamily: 'cantata'),)),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10,bottom: 20),
                    child: Image(image: AssetImage('assets/book1.jpg'),height: 100,width: 100,),
                  )
                ],
              ),
            ),
          ),


        ],
      ),
    )
    );
  }
}
