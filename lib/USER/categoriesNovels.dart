import 'package:bookish_beats/CONSTANT/myFunctions.dart';
import 'package:bookish_beats/CONSTANT/myWidget.dart';
import 'package:bookish_beats/USER/bookDetails.dart';
import 'package:bookish_beats/USER/home.dart';
import 'package:flutter/material.dart';

import '../BOTNAVBAR/navigationBar.dart';

class cactegoriesNovels extends StatelessWidget {
  cactegoriesNovels({super.key});

  List<String> ctgrimg =[
    "assets/book3.jpg",
    "assets/book1.jpg",
    'assets/book2.jpg',
    'assets/book1.jpg',
    'assets/book2.jpg',
    'assets/book3.jpg'

  ];
  List<String> rtng=[
    'assets/Group5.png',
    'assets/Group5.png',
    'assets/Group5.png',
    'assets/Group5.png',
    'assets/Group5.png',
    'assets/Group5.png',

  ];
  List<String> bookprice =[
    '675',
    '360',
    '260',
    '675',
    '360',
    '260',

  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(toolbarHeight: 90,
          flexibleSpace: Image.asset('assets/pic3.png',fit: BoxFit.fill,),
          bottom: PreferredSize(preferredSize: Size.fromHeight(3),
              child:Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: srchbr(),
              ),

          ),
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: (){
              back(context);
            },
              child: Icon(Icons.arrow_back,color: Colors.white)),
          title: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text('Novels',style: TextStyle(fontFamily:'gravitas' ,fontSize: 20,color: Colors.white)),
          ),


        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                  itemCount: ctgrimg.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                    childAspectRatio: .75,
                  ),
                  itemBuilder: (BuildContext context,int index){
                    return Padding(
                      padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                      child: Container(
                        decoration: BoxDecoration(color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow:[BoxShadow(color:Color(0xff3E2501),blurRadius:3,
                              blurStyle: BlurStyle.outer, spreadRadius: 2)],



                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Image(image: AssetImage(ctgrimg[index]),height:100),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(right: 60,top: 10),
                              child: Image(image: AssetImage(rtng[index])),
                            ),
                            Row(
                              children: [
                                Icon(Icons.currency_rupee,color: Color(0xff4a3211),size: 20),
                                Text(bookprice[index],style: TextStyle(fontFamily: 'cantata',fontSize: 10,color: Colors.black),),


                              ],
                            ),
                            ElevatedButton(

                                style:ElevatedButton.styleFrom(
                                    backgroundColor:Color(0xff3E2501),
                                    elevation:5,
                                    minimumSize: Size(60, 40)
                                  // fixedSize:Size(110,6)
                                ),

                                onPressed:(){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>bookDetails()));

                                } ,
                                child: Text("View Details",style: TextStyle(fontSize: 13,color: Colors.white,fontFamily: 'cantata'),)),
                          ],
                        ),

                      ),
                    );
                  }



              ),
            ),

          ],
        ),
      ),
    );
  }
}
