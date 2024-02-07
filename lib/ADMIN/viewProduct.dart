import 'package:bookish_beats/ADMIN/adminHome.dart';
import 'package:bookish_beats/ADMIN/addProduct.dart';
import 'package:bookish_beats/ADMIN/viewDetails.dart';
import 'package:bookish_beats/CONSTANT/myFunctions.dart';
import 'package:bookish_beats/PROVIDER/mainProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class viewProduct extends StatelessWidget {
  viewProduct({super.key});

  List<String> ctgrimg =[
    "assets/book3.jpg",
    "assets/book1.jpg",
    'assets/book2.jpg',


  ];
  List<String> rtng=[
    'assets/Group5.png',
    'assets/Group5.png',
    'assets/Group5.png',


  ];
  List<String> bookprice =[
    '675',
    '360',
    '260',


  ];



  @override
  Widget build(BuildContext context) {
    mainProvider provider = Provider.of<mainProvider>(context,listen: false);

    return  Scaffold(
      floatingActionButton: FloatingActionButton(shape: CircleBorder(),
        backgroundColor: Color(0xff3E2501), onPressed: () {
        provider.clearproduct();
          Navigator.push(context, MaterialPageRoute(builder: (context)=>addProduct(
            frmId: "New",toId: "",
          )));


        },
        child: Icon(Icons.add,color: Colors.white),
      ),
    appBar:  AppBar(toolbarHeight: 60,
      flexibleSpace: Image.asset('assets/pic3.png',fit: BoxFit.fill,),
      bottom: PreferredSize(preferredSize: Size.fromHeight(3),
        child:Padding(
          padding: const EdgeInsets.only(bottom: 10),

        ),

      ),
      automaticallyImplyLeading: false,
      leading: InkWell(onTap: (){
        provider.getBookDetails();
        Navigator.push(context, MaterialPageRoute(builder: (context)=>adminHome()));

      },
          child: Icon(Icons.arrow_back,color: Colors.white)),
      title: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text('View Product',style: TextStyle(fontFamily:'cantata' ,fontSize: 20,color: Colors.white)),
      ),


    ),
      body: Column(
        children: [
          Expanded(
            child: Consumer<mainProvider>(
              builder: (context,value,chld) {
                return GridView.builder(
                    itemCount: value.bookList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 20,
                      childAspectRatio: .70,
                    ),
                    itemBuilder: (BuildContext context,int index){
                      var items=value.bookList[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
                        child: Consumer<mainProvider>(
                          builder: (context,value,child) {
                            return GestureDetector(
                              onLongPress: (){
                                showDialog(context: context, builder: (cfg)=>AlertDialog(
                                  content: Text("Are you sure you want to delete?",style: TextStyle(color: Colors.black,
                                      fontFamily: 'cantata',fontSize: 15
                                  )),
                                  actions: [
                                    TextButton(onPressed: (){
                                      value.deleteProduct(context,
                                          value.bookList[index].id);
                                      Navigator.pop(context);

                                    },
                                        child: Text("Delete"))
                                  ],
                                ));

                              },

                              child: Container(
                                decoration: BoxDecoration(color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow:[BoxShadow(color: Colors.black,blurRadius:4,
                                      blurStyle: BlurStyle.outer, spreadRadius: 5)],



                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Container(height: 100,
                                          width: 400,
                                          child: Image.network(value.bookList[index].BookImage))
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(right: 60,top: 10),
                                      child: Text(value.bookList[index].bookname,style: TextStyle(fontFamily: 'cantata',fontSize: 14,color: Colors.black),),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.currency_rupee,color: Color(0xff4a3211),size: 20),
                                        Text(value.bookList[index].price,style: TextStyle(fontFamily: 'cantata',fontSize: 10,color: Colors.black),),


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
                                          callNext(context, viewDetails(
                                            image:items.BookImage,
                                            Bookname: items.bookname,
                                            Authorname: items.authorname,
                                            categoryname: '',
                                            description: items.description,
                                            price: items.price,
                                            bookid: items.id,
                                          ));

                                        } ,

                                        child: Text("View Details",style: TextStyle(fontSize: 13,color: Colors.white,fontFamily: 'cantata'),)),
                                  ],
                                ),

                              ),
                            );
                          }
                        ),
                      );
                    }



                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
