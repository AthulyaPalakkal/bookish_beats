import 'package:bookish_beats/CONSTANT/myFunctions.dart';
import 'package:bookish_beats/PROVIDER/mainProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class ViewOrders extends StatelessWidget {
  ViewOrders({super.key});
  List<String> booksimg =[
    'assets/book3.jpg',
    'assets/book1.jpg',
    'assets/book2.jpg',

  ];
  List<String> txt =[
    'the kite runner',
    'irutti oru punnyalan',
    'orikkal'
  ];

  double? _ratingValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            back(context);
},
            child: Icon(Icons.arrow_back,color: Colors.white)),
          title: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('View Orders',style: TextStyle(fontFamily:'gravitas' ,fontSize: 20,color: Colors.white)),
          ),


        ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: booksimg.length,
                itemBuilder: (BuildContext context ,int index){
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.79,
                    height: 150,
                    decoration:BoxDecoration(
                      gradient: LinearGradient(
                    colors: [Color(0xff3d2603), Color(0xff9b5e01), Color(0xffff9800)],),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30),bottomRight: Radius.circular(30),)
                    ),
                    child: Row(
                      children: [
                        Image(image: AssetImage(booksimg[index]),height: 100,width: 100,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Delivered on jan 4",style: TextStyle(
                              color: Colors.white,fontSize:16,fontFamily: 'cantata',
                            ),),
                            Text(txt[index],style: TextStyle(
                              fontFamily: 'cantata',fontSize: 18,color: Colors.white,
                            ),),
                            TextButton(onPressed: () {
                               alert(context);
                            }, child: Container(
                              width: 100,
                              height: 40,
                              child: Center(child: Text("Rating",style: TextStyle(color: Colors.white,fontSize: 16),)),
                              decoration: BoxDecoration(color:Color(0xff3E2501) ,borderRadius: BorderRadius.circular(20)),
                            ) )


                          ],

                        )
                      ],
                    ),
                  ),
                );

                }
            ),
          )

        ],
      ),
    );
  }
  alert(BuildContext context){
    showDialog(context: context, builder: (ctx)=>AlertDialog(
      title: Text("Rating"),
      content: Text("Your rating"),
      actions: <Widget>[
        Consumer<mainProvider>(
          builder: (context,val,child) {
            return RatingBar(
                initialRating: 0,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                ratingWidget: RatingWidget(
                    full: const Icon(Icons.star, color: Colors.orange),
                    half: const Icon(
                      Icons.star_half,
                      color: Colors.orange,
                    ),
                    empty: const Icon(
                      Icons.star_outline,
                      color: Colors.orange,
                    )),
                onRatingUpdate: (value) {
                  val.rtngs(value);

                });
          }
        ),
        Consumer<mainProvider>(
          builder: (context,val,child) {
            return Text(
              val.ratingValue != null ? val.ratingValue.toString() : 'Rate it!',
              style: const TextStyle(color: Colors.black, fontSize: 13),
            );
          }
        ),

        TextButton(onPressed: (){
          back(context);

          print("hellooo");

        }, child: Container(
          height: 40,
          width: 65,
          decoration:BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xff3E2501),
          ),
          child: Center(child: Text("Submit",style: TextStyle(color: Colors.white),)),
        )),

      ],

    ));

  }


}
