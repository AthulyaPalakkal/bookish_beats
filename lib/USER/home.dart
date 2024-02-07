import 'package:bookish_beats/CONSTANT/myFunctions.dart';
import 'package:bookish_beats/CONSTANT/myWidget.dart';
import 'package:bookish_beats/PROVIDER/mainProvider.dart';
import 'package:bookish_beats/USER/bookDetails.dart';
import 'package:bookish_beats/USER/categoriesNovels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:provider/provider.dart';

class home extends StatelessWidget {
   home({super.key});

   List<String> names=[
     "Novel",
     "Classic",
     "Non Fiction",
     "Poems",
     "Story",
     "Translation",
     "Thriller",
     "Travelogue"

   ];
   List<String> bestselimg =[
    "assets/book3.jpg",
     "assets/book1.jpg",
     'assets/book2.jpg',
     'assets/book1.jpg',
     'assets/book2.jpg',
     'assets/book3.jpg'

   ];
   List<String> txt =[
     "AGATHA CHRISTIE",
     "Kalkki Krishnamoorthi",
     "Joseph Annamkutty Jose",
     "AGATHA CHRISTIE",
     "Kalkki Krishnamoorthi",
     "AGATHA CHRISTIE",
   ];
   List<String> ratings=[
     'assets/Group5.png',
     'assets/Group5.png',
     'assets/Group5.png',
     'assets/Group5.png',
     'assets/Group5.png',
     'assets/Group5.png',

   ];
   List<String> price =[
     '675',
     '360',
     '260',
     '675',
     '360',
     '260',

   ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 100,
        flexibleSpace: Image.asset('assets/pic3.png',fit: BoxFit.fill,),
        bottom: PreferredSize(preferredSize: Size.fromHeight(10),
            child:srchbr()

        ),
        automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Column(
              children: [// rainbow text with reverse
                GradientAnimationText(
                  text: Text(
                     ' Bookish Beats',style: TextStyle(fontFamily:'gravitas' ,fontSize: 20)
                  ),
                  colors: [
                    Color(0xff9b5e01),
                    Colors.white,
                    Color(0xffff9800)
                  ],
                  duration: Duration(seconds: 3),
                  reverse: true,  // reverse
                ),
                // Text('Bookish Beats',style: TextStyle(fontFamily:'gravitas' ,fontSize: 20,color: Colors.white)),
                Text('Where Book Lovers Belong',style: TextStyle(color:Color(0xff79674e),fontSize: 16 ),)
              ],
            ),
          ),
        actions: [
          Consumer<mainProvider>(
            builder: (context,value,child) {
              return value.profileimage.isNotEmpty? Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CircleAvatar(backgroundColor:Color(0xffd9d9d9),
                      maxRadius: 25,backgroundImage: NetworkImage(value.profileimage!)
                  ),
              ): CircleAvatar(backgroundColor:Color(0xffd9d9d9),
                  maxRadius: 25,child: Icon(Icons.person),
                );
            }
          )
        ],

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:30),
              child: SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection:Axis.horizontal,
                  children: [
                    SizedBox(width: 20,),
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
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>bookDetails()));

                                    } ,
                                    child: Text("Buy Now",style: TextStyle(fontSize: 14,color: Colors.black,fontFamily: 'cantata'),)),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40,bottom: 20),
                              child: Image(image: AssetImage('assets/book1.jpg'),),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
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
                                Text("  Book of \n  the week",style: TextStyle(fontFamily: 'cantata',
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
                                    child: Text("Buy Now",style: TextStyle(fontSize: 14,color: Colors.black,fontFamily: 'cantata'),)),


                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40,bottom: 20),
                              child: Image(image: AssetImage('assets/book2.jpg')),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
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
                                Text("  Book of \n  the week",style: TextStyle(fontFamily: 'cantata',
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
                                    child: Text("Buy Now",style: TextStyle(fontSize: 14,color: Colors.black,fontFamily: 'cantata'),)),


                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 40,bottom: 20),
                              child: Image(image: AssetImage('assets/book3.jpg')),
                            )
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(right: 200),
              child: Text('Categories',style: TextStyle(fontFamily: 'cantata',color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
            ),
            SizedBox(height: 10,),
            SizedBox(height: 40,
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>cactegoriesNovels()));

                },
                child: Consumer<mainProvider>(
                  builder: (context,value,child) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemCount: value.categorynameslist.length,
                        itemBuilder:(BuildContext context, int index){
                          var ctnameitems=value.categorynameslist[index];

                          return Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Container(width: 100,height: 20,
                            decoration: BoxDecoration(color: Colors.white30,
                                border: Border.all(color: Colors.brown),borderRadius: BorderRadius.circular(30)
                            ),
                            child: Center(child: Text(value.categorynameslist[index].categoryname,style: TextStyle(color: Colors.black,fontSize: 12,fontFamily: 'cantata'),)),
                          ),
                        );
                        });
                  }
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 190),
            //   child: Text('Best Sellers',style: TextStyle(fontFamily: 'cantata',color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
            // ),
            ListTile(
              leading: Text("Best Sellers",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'cantata')),
              // trailing: Text("View All", style: TextStyle(fontSize: 16,color: Colors.blue,fontFamily: 'cantata')),
            ),
            SizedBox(height: 250,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: bestselimg.length,
                  itemBuilder:(BuildContext context, int index){
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: InkWell(
                              onTap: (){
                                callNext(context, bookDetails());
                              },
                              child: Container(width: 90,height: 210,
                                decoration: BoxDecoration(color: Colors.white,

                                ),
                                child: Column(
                                  children: [
                                    Image(image: AssetImage(bestselimg[index]),),
                                    Text(txt[index],style: TextStyle(fontFamily: 'cantata',fontSize: 10,color: Colors.black),),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: Image(image: AssetImage(ratings[index]),),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.currency_rupee,color: Color(0xff4a3211),size: 20),
                                        Text(price[index],style: TextStyle(fontFamily: 'cantata',fontSize: 10,color: Colors.black),),


                                      ],
                                    ),

                                  ],
                                ),


                              ),
                            ),
                          ),
                          // SizedBox(height: 10,),
                          // Text(txt[index],style: TextStyle(fontFamily: 'cantata',fontSize: 10,color: Colors.black),)



                        ],
                      ),
                    );
                  }),
            ),

    ],
        ),
      ),

    );
  }
}
