import 'package:bookish_beats/ADMIN/viewEvents.dart';
import 'package:bookish_beats/CONSTANT/myFunctions.dart';
import 'package:bookish_beats/PROVIDER/mainProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class addEvents extends StatelessWidget {
   addEvents({super.key});

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
        leading: Icon(Icons.arrow_back,color: Colors.white),
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text('Add Events',style: TextStyle(fontFamily:'cantata' ,fontSize: 20,color: Colors.white)),
        ),


      ),
      body: Center(
        child: SingleChildScrollView(
          child: Consumer<mainProvider>(
            builder: (context,value,child) {
              return Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text('Event Details',style: TextStyle(color: Colors.black,fontSize: 18,fontFamily: 'cantata'),),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(right:200),
                    child: Text('Event type:',style: TextStyle(color: Colors.black,fontFamily: 'cantata',fontSize: 16),),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width/1.1,
                    child: TextField(
                      controller: value.eventTypeController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),

                          )

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(child: Padding(
                              padding: const EdgeInsets.only(right: 80),
                              child: Text('Date:',style: TextStyle(color: Colors.black,fontFamily: 'cantata',fontSize: 16),),
                            )),
                            SizedBox(width: MediaQuery.of(context).size.width/2.5,
                              child: TextField(
                                controller: value.dateController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),

                                    )

                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 30,),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 80),
                              child: Text('Time:',style: TextStyle(color: Colors.black,fontFamily: 'cantata',fontSize: 16),),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width/2.5,
                              child: TextField(
                                controller: value.timeController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),

                                    )

                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:260),
                    child: Text('Venu:',style: TextStyle(color: Colors.black,fontFamily: 'cantata',fontSize: 16),),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width/1.1,
                    child: TextField(
                      controller: value.venuController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),

                          )

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 260),
                    child: Text('Topic:',style: TextStyle(color: Colors.black,fontFamily: 'cantata',fontSize: 16),),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width/1.1,
                    child: TextField(
                      controller: value.topicController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),

                          )

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:260),
                    child: Text('Guests:',style: TextStyle(color: Colors.black,fontFamily: 'cantata',fontSize: 16),),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width/1.1,
                    child: TextField(
                      controller: value.guestController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),

                          )

                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  InkWell(
                    onTap: (){
                      value.addevents();
                      value.getEvents();
                      callNext(context, viewEvents());
                    },
                    child: Container(
                      width: 150,
                      height: 30,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                          boxShadow: [BoxShadow(color: Color(0xff3E2501),spreadRadius:10)],
                          color:Color(0xff3E2501) ),
                      child: Center(child: Text('Save',style: TextStyle(fontFamily: 'cantata',fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold))),

                    ),
                  ),

                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
