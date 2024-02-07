import 'package:bookish_beats/ADMIN/addProduct.dart';
import 'package:bookish_beats/CONSTANT/myFunctions.dart';
import 'package:bookish_beats/PROVIDER/mainProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class viewDetails extends StatelessWidget {
  String image;
  String Bookname;
  String Authorname;
  String categoryname;
  String description;
  String price;
  String bookid;
  viewDetails({super.key,required this.image,required this.Bookname,required this.Authorname,required this.categoryname,required this.description,required this.price,required this.bookid});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor:  Color(0xff3E2501),
      body: Consumer<mainProvider>(
        builder: (context,value,child) {
          return Column(
            children: [
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(right:300),
                child: InkWell(onTap: (){
                  back(context);
                },
                    child: Icon(Icons.arrow_back_outlined,color: Colors.white,size: 32,)),
              ),
              SizedBox(height: 20,),
              Center(child: Container(
                height: 170,
                  width: 200,
                  child: Image.network(image,fit:BoxFit.fill),),),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text('Book :',style: TextStyle(color: Colors.white,fontSize: 12,fontFamily: 'cantata',),),
                    Text(Bookname,style: TextStyle(color: Colors.white,fontSize: 12,fontFamily: 'cantata',),),

                  ],
                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text('Author :',style: TextStyle(color: Colors.white,fontSize: 12,fontFamily: 'cantata',),),
                    Text(Authorname,style: TextStyle(color: Colors.white,fontSize: 12,fontFamily: 'cantata',),),
                  ],
                ),
              ),
              SizedBox(height: 5,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Text('Category :',style: TextStyle(color: Colors.white,fontSize: 12,fontFamily: 'cantata',),),
                    Text(categoryname,style: TextStyle(color: Colors.white,fontSize: 12,fontFamily: 'cantata',),),
                  ],
                ),
              ),

              Expanded(

                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/1.86,
                    decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 100,top: 10),
                            child: Text('Book Summary',style: TextStyle(color: Colors.black,
                                fontFamily: 'cantata',
                                fontSize: 22,fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10,top:10,right: 10),
                            child: Text(description,style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: 'cantata'),),
                          ),
                          SizedBox(height: 10,),
                          Padding(
                            padding: const EdgeInsets.only(right: 200),
                            child: Image(image:AssetImage('assets/group7.png'),height: 25,),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Icon(Icons.currency_rupee,color: Color(0xff4a3211),size: 30),
                                Text(price,style: TextStyle(fontFamily: 'cantata',fontSize: 22,color: Colors.black),),
                      
                      
                              ],
                            ),
                          ),
                          Consumer<mainProvider>(
                            builder: (context,value,child) {
                              return ElevatedButton(
                      
                                  style:ElevatedButton.styleFrom(
                                      backgroundColor:Color(0xff3E2501),
                                      elevation:5,
                                      minimumSize: Size(120, 40)
                                    // fixedSize:Size(110,6)
                                  ),
                      
                                  onPressed:(){
                                    value.clearproduct();
                                    value.editDetails(bookid);
                                    callNext(context, addProduct(
                                      frmId:"Edit", toId: bookid,
                                    ));
                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>deliveryDetails()));
                      
                                  } ,
                                  child: Text("Edit",style: TextStyle(fontSize: 14,color: Colors.white,fontFamily: 'cantata'),));
                            }
                          ),
                        ],
                      ),
                    ),

                  ),
                ),
              )



            ],
          );
        }
      ),
    ));
  }
}
