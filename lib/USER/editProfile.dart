
import 'package:bookish_beats/CONSTANT/myFunctions.dart';
import 'package:bookish_beats/USER/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../PROVIDER/mainProvider.dart';

class editProfile extends StatelessWidget {
  String userId;
  // String loginphno;
  // String loginUsername;

  editProfile({required this.userId,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Consumer<mainProvider>(
          builder: (context,value,child) {
            return Column(
              children: [
                Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 190,
                      decoration: BoxDecoration(color: Color(0xff3E2501),
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(50),bottomLeft: Radius.circular(50))

                      ),


                    ),
                    Positioned(top: 30,
                        left: 30,
                        child: Row(
                          children: [
                            InkWell(onTap: (){
                              back(context);
                            },
                                child: Icon(Icons.arrow_back,color: Colors.white,size: 30,)),
                            Padding(
                              padding: const EdgeInsets.only(left: 60,top: 10),
                              child: Text('Edit Profile',style: TextStyle(color: Colors.white,
                                  fontFamily: 'cantata',fontSize: 22),),
                            )
                          ],
                        )),


                    Padding(
                      padding: const EdgeInsets.only(top:130),
                      child: Center(
                          child: Consumer<mainProvider>(
                            builder: (context,value,child) {
                              return
                                InkWell(
                                  onTap: (){
                                    showBottomSheet(context);
                                  },
                                  child:value.fileprofileimage!=null?
                                  CircleAvatar(backgroundColor:Color(0xffd9d9d9),
                                  maxRadius: 70,backgroundImage: FileImage(value.fileprofileimage!)

                                ):value.profileimage!=""? CircleAvatar(backgroundColor:Color(0xffd9d9d9),
                                  maxRadius: 70,backgroundImage: NetworkImage(value.profileimage!)
                              ): CircleAvatar(backgroundColor:Color(0xffd9d9d9),
                                  maxRadius: 70,child:Icon(Icons.camera_alt_outlined),
                              )
                                );
                            }
                          )
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                SizedBox(width: MediaQuery.of(context).size.width/1.1,
                  child: TextField(
                    controller: value.userNumberController,
                    keyboardType: TextInputType.phone,
                    enabled: false,
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    decoration: InputDecoration(
                        // hintText: "Edit Your Number",
                        prefixIcon: Icon(Icons.call,color: Color(0xff3E2501)),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)

                    ),
                  ),
                ),
                SizedBox(height: 20,),

                SizedBox(width: MediaQuery.of(context).size.width/1.1,
                  child: TextField(
                    controller: value.userNameController,
                    decoration: InputDecoration(
                        // hintText: "Edit Your Name",
                        prefixIcon: Icon(Icons.person,color: Color(0xff3E2501)),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)

                    ),
                  ),
                ),
                SizedBox(height: 20,),

                // SizedBox(width: MediaQuery.of(context).size.width/1.1,
                //   child: TextField(
                //
                //
                //     decoration: InputDecoration(
                //         hintText: "Edit Your Address",
                //         prefixIcon: Icon(Icons.location_on_outlined,color: Color(0xff3E2501)),
                //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),)
                //
                //     ),
                //   ),
                // ),
                SizedBox(height: 50,),
                Consumer<mainProvider>(
                  builder: (context,value,child) {
                    return InkWell(
                      onTap: (){
                        value.userSignup(userId, "EDIT");
                       back(context);
                      },
                      child: Container(
                        width: 150,
                        height: 30,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                            boxShadow: [BoxShadow(color: Color(0xff3E2501),spreadRadius:10)],
                            color:Color(0xff3E2501) ),
                        child: Center(child: Text('Update',style: TextStyle(fontFamily: 'cantata',fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold))),

                      ),
                    );
                  }
                )

              ],
            );
          }
        ),
      ),
    );
  }

}
void showBottomSheet(BuildContext context) {
  mainProvider provider = Provider.of<mainProvider>(context,listen: false);

  showModalBottomSheet(
      elevation: 10,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          )),
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
          children: <Widget>[
            ListTile(
                leading: Icon(
                  Icons.camera_enhance_sharp,
                  color: Colors.black54,
                ),
                title: const Text(
                  'Camera',
                ),
                onTap: () =>
                {provider.getprofileImagecamera(), Navigator.pop(context)}),
            ListTile(
                leading: Icon(Icons.photo, color: Colors.black),
                title: const Text(
                  'Gallery',
                ),
                onTap: () =>
                {provider.getprofileImagegallery(), Navigator.pop(context)}),
          ],
        );
      });
  //ImageSource
}

