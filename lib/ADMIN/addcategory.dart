import 'package:bookish_beats/ADMIN/adminHome.dart';
import 'package:bookish_beats/ADMIN/viewcategory.dart';
import 'package:bookish_beats/PROVIDER/mainProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class addcategory extends StatelessWidget {
  addcategory({super.key});

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
   leading: InkWell(
     onTap: (){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>addcategory()));

     },
       child: Icon(Icons.arrow_back,color: Colors.white)),
   title: Padding(
     padding: const EdgeInsets.only(left: 40),
     child: Text('Add category',style: TextStyle(fontFamily:'cantata' ,fontSize: 20,color: Colors.white)),
   ),


 ),
      body: Column(
        children: [
          SizedBox(width: MediaQuery.of(context).size.width/1.1,
            child: Padding(
              padding: const EdgeInsets.only(left: 30,top: 50),
              child: Consumer<mainProvider>(
                builder: (context,value,child) {
                  return TextField(
                    controller: value.nameController,


                    decoration: InputDecoration(
                        hintText: "Type here",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),

                        )

                    ),
                  );
                }
              ),
            ),
          ),
          SizedBox(height: 60,),
          Consumer<mainProvider>(
            builder: (context,value,child) {
              return InkWell(
                onTap: (){
                  value.addcategory();
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>viewcategory()));
                },
                child: Container(
                  width: 150,
                  height: 30,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                      boxShadow: [BoxShadow(color: Color(0xff3E2501),spreadRadius:10)],
                      color:Color(0xff3E2501) ),
                  child: Center(child: Text('Submit',style: TextStyle(fontFamily: 'cantata',fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold))),

                ),
              );
            }
          )
        ],
      ),
    );
  }
}
