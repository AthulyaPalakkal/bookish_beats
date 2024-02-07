import 'package:bookish_beats/ADMIN/order.dart';
import 'package:flutter/material.dart';

class orderList extends StatelessWidget {
  orderList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(toolbarHeight: 60,
        flexibleSpace: Image.asset('assets/pic3.png',fit: BoxFit.fill,),
        bottom: PreferredSize(preferredSize: Size.fromHeight(3),
          child:Padding(
            padding: const EdgeInsets.only(bottom: 10),

          ),

        ),
        automaticallyImplyLeading: false,
        leading: Icon(Icons.arrow_back,color: Colors.white),
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text('Order List',style: TextStyle(fontFamily:'cantata' ,fontSize: 20,color: Colors.white)),
        ),


      ),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Center(
            child: Container(
              width: 300,
              height: 90,
              decoration: BoxDecoration(color: Color(0xff4b3a1f),borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:30,top: 10,),
                    child: Row(
                      children: [
                        Text('Name: Anu ',style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'cantata'),),
                        SizedBox(width: 70,),
                        ElevatedButton(

                            style:ElevatedButton.styleFrom(
                                backgroundColor:Color(0xffd1ad76),
                                elevation:5,
                                minimumSize: Size(70, 30)
                              // fixedSize:Size(110,6)
                            ),

                            onPressed:(){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>order()));
                            } ,
                            child: Text("Take",style: TextStyle(fontSize: 14,color: Colors.black,fontFamily: 'cantata'),)),

                      ],
                    ),
                  ),Padding(
                    padding: const EdgeInsets.only(right: 50),
                    child: Text('srinilayam,palakkad,',style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'cantata'),),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width: 300,
            height: 90,
            decoration: BoxDecoration(color: Color(0xff4b3a1f),borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:30,top: 10,),
                  child: Row(
                    children: [
                      Text('Name: Athulya ',style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'cantata'),),
                      SizedBox(width: 40,),
                      ElevatedButton(

                          style:ElevatedButton.styleFrom(
                              backgroundColor:Color(0xffd1ad76),
                              elevation:5,
                              minimumSize: Size(70, 30)
                            // fixedSize:Size(110,6)
                          ),

                          onPressed:(){
                          } ,
                          child: Text("Take",style: TextStyle(fontSize: 14,color: Colors.black,fontFamily: 'cantata'),)),

                    ],
                  ),
                ),Padding(
                  padding: const EdgeInsets.only(right: 70),
                  child: Text('palakkal,palakkad',style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'cantata'),),
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            width: 300,
            height: 90,
            decoration: BoxDecoration(color: Color(0xff4b3a1f),borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:30,top: 10,),
                  child: Row(
                    children: [
                      Text('Name: Anu ',style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'cantata'),),
                      SizedBox(width: 70,),
                      ElevatedButton(

                          style:ElevatedButton.styleFrom(
                              backgroundColor:Color(0xffd1ad76),
                              elevation:5,
                              minimumSize: Size(70, 30)
                            // fixedSize:Size(110,6)
                          ),

                          onPressed:(){
                          } ,
                          child: Text("Take",style: TextStyle(fontSize: 14,color: Colors.black,fontFamily: 'cantata'),)),

                    ],
                  ),
                ),Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Text('srinilayam,palakkad,',style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'cantata'),),
                ),
              ],
            ),
          ),

        ],
      ),


    );
  }
}
