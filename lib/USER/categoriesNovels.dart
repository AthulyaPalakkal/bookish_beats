import 'package:bookish_beats/CONSTANT/myColor.dart';
import 'package:bookish_beats/CONSTANT/myFunctions.dart';
import 'package:bookish_beats/CONSTANT/myWidget.dart';
import 'package:bookish_beats/PROVIDER/mainProvider.dart';
import 'package:bookish_beats/USER/bookDetails.dart';
import 'package:bookish_beats/USER/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    mainProvider provider=Provider.of<mainProvider>(context,listen: false);
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
              child: Icon(Icons.arrow_back,color: clWhite)),
          title: Padding(
            padding: const EdgeInsets.only(left: 50),
            child: Text('Novels',style: TextStyle(fontFamily:'gravitas' ,fontSize: 20,color: clWhite)),
          ),


        ),
        body:
        Column(
          children: [
            Expanded(
              child: Consumer<mainProvider>(
                builder: (context,value,child) {

                  print("aacvshc"+value.bookList.length.toString());
                  return value.bookList.isNotEmpty?GridView.builder(
                      itemCount: value.bookList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 20,
                        childAspectRatio: .75,
                      ),
                      itemBuilder: (BuildContext context,int index){
                        return Padding(
                          padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                          child:
                          Container(
                            decoration: BoxDecoration(color: clWhite,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow:[BoxShadow(color:cl3E2501,blurRadius:3,
                                  blurStyle: BlurStyle.outer, spreadRadius: 2)],



                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Image(image: NetworkImage(value.bookList[index].BookImage),height:100),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(right: 60,top: 10),
                                  child: Image(image: AssetImage(rtng[index])),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.currency_rupee,color: Color(0xff4a3211),size: 20),
                                    Text(value.bookList[index].price,style: TextStyle(fontFamily: 'cantata',fontSize: 10,color: clBlack),),


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
                                    child: Text("View Details",style: TextStyle(fontSize: 13,color:clWhite,fontFamily: 'cantata'),)),
                              ],
                            ),

                          ),
                        );
                      }



                  ):
                  Text("ghjk");
                }
              ),
            ),

          ],
        ),

      ),
    );
  }
}
