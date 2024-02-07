import 'package:bookish_beats/ADMIN/addEvents.dart';
import 'package:bookish_beats/CONSTANT/myFunctions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../PROVIDER/mainProvider.dart';

class viewEvents extends StatelessWidget {
  viewEvents({super.key});
  List<String> evlist=[

  ];

  @override
  Widget build(BuildContext context) {
    var width =MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    mainProvider provider = Provider.of<mainProvider>(context,listen: false);

    return Scaffold(
      floatingActionButton:  FloatingActionButton(shape: CircleBorder(),
        backgroundColor: Color(0xff3E2501), onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>addEvents()));

        },
        child: Icon(Icons.add,color: Colors.white),
      ),
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
            provider.getEvents();
            back(context);
          },
            child: Icon(Icons.arrow_back,color: Colors.white)),
        title: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Text('Add Events',style: TextStyle(fontFamily:'cantata' ,fontSize: 20,color: Colors.white)),
        ),


      ),
      body: Consumer<mainProvider>(
        builder: (context,value,child) {
          return ListView.builder(
            // padding: EdgeInsets.all(15),
              // scrollDirection: Axis.vertical,
              itemCount:value.eventsList.length,

              itemBuilder:(BuildContext context, int index ) {
               return Padding(
                 padding: const EdgeInsets.all(15),
                 child: Consumer<mainProvider>(
                   builder: (context,value,child) {
                     return GestureDetector(
                       onLongPress:  (){
                         showDialog(context: context, builder: (abc)=>AlertDialog(
                           content: Text("Delete or Edit",style: TextStyle(color: Colors.black,
                               fontFamily: 'cantata',fontSize: 15
                           )),
                           actions: [
                             TextButton(onPressed: (){
                               value.deleteEvents(context,
                                   value.eventsList[index].id);
                               Navigator.pop(context);

                             },
                                 child: Text("Delete")),

                             TextButton(onPressed: (){
                               (context, value.eventsList[index].id);
                               Navigator.pop(context);

                             },
                                 child: Text("Edit"))
                           ],
                         ));
                       },
                       child: Container(
                          width: MediaQuery.of(context).size.width/1.1,
                          height: MediaQuery.of(context).size.height/3,
                          decoration: BoxDecoration(color:Color(0xff3E2501),borderRadius: BorderRadius.circular(20),
                              boxShadow:  [BoxShadow(color: Color(0xff3E2501),blurRadius: 5,
                                  blurStyle: BlurStyle.solid, spreadRadius: 5)]),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Column(
                                children: [
                                  Text(value.eventsList[index].eventType,style: TextStyle(color: Colors.white,fontSize: 20,
                                      fontFamily: 'cantata',fontWeight: FontWeight.bold),),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 40),
                                    child: Row(
                                      children: [
                                        Text('Date:',style: TextStyle(color:Colors.white,fontFamily: 'cantata',fontSize: 16),),
                                        Text(value.eventsList[index].date,style: TextStyle(color:Colors.white,fontFamily: 'cantata',fontSize: 16),),

                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 40),
                                    child: Row(
                                      children: [
                                        Text('Time:',style: TextStyle(color:Colors.white,fontFamily: 'cantata',fontSize: 16),),
                                        Text(value.eventsList[index].time,style: TextStyle(color:Colors.white,fontFamily: 'cantata',fontSize: 16),),

                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Text('Venu: ',style: TextStyle(fontSize: 16,fontFamily: 'cantata',color: Colors.white),),
                                      Text(value.eventsList[index].venu,style: TextStyle(fontSize: 16,fontFamily: 'cantata',color: Colors.white),),
                                    ],
                                  ),
                                  SizedBox(height: 8,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Topic: ',style: TextStyle(color: Colors.white,fontFamily: 'cantata',fontSize: 14)),
                                      SizedBox(width: width/1.6,
                                          child: Text(value.eventsList[index].topic,style: TextStyle(color: Colors.white,fontFamily: 'cantata',fontSize: 14))),
                                    ],
                                  ),
                                  SizedBox(height: 8,),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('Guests: ',style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: 'cantata'),),
                                      SizedBox(width: width/1.6,
                                          child: Text(value.eventsList[index].gusets,style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: 'cantata'),)),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                     );
                   }
                 ),
               );
          });
        }
      ),
    );
  }
}
