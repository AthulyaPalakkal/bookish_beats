
import 'package:bookish_beats/CONSTANT/myFunctions.dart';
import 'package:bookish_beats/PROVIDER/mainProvider.dart';
import 'package:bookish_beats/USER/ViewOrders.dart';
import 'package:bookish_beats/USER/aboutPage.dart';
import 'package:bookish_beats/USER/editProfile.dart';
import 'package:bookish_beats/USER/loginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class profilePage extends StatelessWidget {
  String userId;
  // String loginphno;
  // String loginUsername;

   profilePage({required this.userId,super.key});

  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: 170,
                decoration: BoxDecoration(color: Color(0xff3E2501),borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),bottomLeft: Radius.circular(50))

                ),


              ),
              Positioned(top: 50,
                  left: 30,
                  child: Row(
                    children: [
                      // Icon(Icons.arrow_back,color: Colors.white,size: 30,),
                      Padding(
                        padding: const EdgeInsets.only(left: 90),
                        child: Consumer<mainProvider>(
                          builder: (context,value,child) {
                            return Text(value.userNameController.text.toString(),style: TextStyle(color: Colors.white,
                            fontFamily: 'gravitas',fontSize: 22),);
                          }
                        ),
                      )
                    ],
                  )),


              Padding(
                padding: const EdgeInsets.only(top:100),
                child: Center(
                  child: Consumer<mainProvider>(
                    builder: (context,value,child) {
                      return value.profileimage.isNotEmpty? CircleAvatar(backgroundColor:Color(0xffd9d9d9),
                          maxRadius: 70,backgroundImage: NetworkImage(value.profileimage!)
                      ): CircleAvatar(backgroundColor:Color(0xffd9d9d9),
                          maxRadius: 70,child: Icon(Icons.camera_alt_outlined),
                      );
                    }
                  ),
                ),
              )



            ],
          ),
          SizedBox(height: 20,),
          Consumer<mainProvider>(
            builder: (context,value,child) {
              return InkWell(onTap: (){
                print(userId+"hhhhhhhhhhhhhhhhhhhhh");
                value.getuser(userId);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>editProfile(userId: userId,)));

              },
                child: Container(
                  width: 130,
                  height: 25,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(color: Color(0xff3E2501),spreadRadius:10)],
                      color:Color(0xff3E2501) ),
                  child: Row(
                    children: [
                      SizedBox(width: 5),
                      Icon(Icons.edit,color:Colors.white ,size: 16),
                      SizedBox(width: 10,),
                      Text('Edit Profile',style: TextStyle(fontFamily: 'cantata',fontSize: 14,color: Colors.white,fontWeight: FontWeight.normal)),


                    ],
                  ),


                ),
              );

























            }
          ),
          SizedBox(height: 10,),
          ListTile(
            leading: Text("Reviews",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'cantata')),
            trailing: InkWell(onTap: (){

            },
              child: Text("View All", style: TextStyle(fontSize: 16,color: Colors.blue,fontFamily: 'cantata')),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width/1.1,
            height: 160,
            decoration: BoxDecoration(color: Colors.white70,
                boxShadow: [BoxShadow(color: Color(0xff3E2501),blurRadius: 5,
                    blurStyle: BlurStyle.outer, spreadRadius: 5)],
               borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Image(image: AssetImage('assets/book3.jpg'),height: 150,),
                SizedBox(width: 10,),
                SizedBox(width: width/1.7,
                  child: Text('The Kite Runner is the first novel by Afghan-American author Khaled Hosseini. Published in 2003 by Riverhead Books,'
                      'it tells the story of Amir, a young boy from the Wazir Akbar Khan '
                      'district of Kabul, whose closest friend is Hassan.'
                    ,style: TextStyle(color: Colors.black,
                    fontSize: 12,fontFamily: 'cantata',),),
                )
              ],
            ),
          ),
          SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.only(right: 170),
            child: InkWell(
              onTap: (){
                callNext(context, ViewOrders());
              },
              child: Container(
                width: 130,
                height: 40,
                decoration: BoxDecoration(color: Colors.white70, border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(10)),
                  child:Row(
                    children: [
                      Icon(Icons.arrow_back_ios_new,color: Colors.green,size: 16),
                      SizedBox(width: 20,),
                      Text('My Orders',style: TextStyle(color: Colors.black,fontFamily: 'cantata',fontSize: 14),)
                    ],
                  )
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(right: 170),
            child: InkWell(
              onTap: (){
                alert(context);

              },
              child: Container(
                  width: 130,
                  height: 40,
                  decoration: BoxDecoration(color: Colors.white70, border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child:Row(
                    children: [
                      SizedBox(width: 10,),
                      Icon(Icons.logout,color: Colors.red,size: 16),
                      SizedBox(width: 20,),
                      Text('LogOut',style: TextStyle(color: Colors.black,fontFamily: 'cantata',fontSize: 14),)
                    ],
                  )
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(right: 170),
            child: InkWell(
              onTap: (){
                callNext(context,aboutPage());
              },
              child: Container(
                  width: 130,
                  height: 40,
                  decoration: BoxDecoration(color: Colors.white70, border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child:Row(
                    children: [
                      SizedBox(width: 10,),
                      Icon(Icons.info_outline,color: Color(0xff3E2501),size: 16),
                      SizedBox(width: 20,),
                      Text('About Us',style: TextStyle(color: Colors.black,fontFamily: 'cantata',fontSize: 14),)
                    ],
                  )
              ),
            ),
          ),


        ],
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
