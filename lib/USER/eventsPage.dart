import 'package:bookish_beats/ADMIN/addEvents.dart';
import 'package:bookish_beats/CONSTANT/myColor.dart';
import 'package:bookish_beats/CONSTANT/myFunctions.dart';
import 'package:bookish_beats/USER/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_animation_text/flutter_gradient_animation_text.dart';
import 'package:provider/provider.dart';

import '../PROVIDER/mainProvider.dart';

class eventsPage extends StatelessWidget {
  eventsPage({super.key});
  List<String> evlist = [];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    mainProvider provider = Provider.of<mainProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        flexibleSpace: Image.asset(
          'assets/pic3.png',
          fit: BoxFit.fill,
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(3),
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
        ),
        automaticallyImplyLeading: true,
        // leading: InkWell(
        //     onTap: (){
        //
        //     },
        //     child: Icon(Icons.arrow_back,color: Colors.white)),
        title: const Center(
            child: Text('View Events',
                style: TextStyle(
                    fontFamily: 'cantata', fontSize: 20, color: clWhite))),
      ),
      body: Column(
        children: [
          // rainbow text with reverse
          const GradientAnimationText(
            text: Text(
              'Upcoming Events',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            colors: [Color(0xff3d2603), Color(0xff9b5e01), Color(0xffff9800)],
            duration: Duration(seconds: 5),
            reverse: true, // reverse
          ),
          // Text("Upcoming Events",style:TextStyle(fontFamily: 'cantata',
          //     fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),

          Consumer<mainProvider>(builder: (context, value, child) {
            return SizedBox(
              height: 600,
              child: ListView.builder(
                  // padding: EdgeInsets.all(15),
                  // scrollDirection: Axis.vertical,
                  itemCount: value.eventsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(15),
                      child: Consumer<mainProvider>(
                          builder: (context, value, child) {
                        return Container(
                          width: MediaQuery.of(context).size.width / 1.1,
                          height: MediaQuery.of(context).size.height / 3,
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Color(0xff3d2603),
                                Color(0xff9b5e01),
                                Color(0xffff9800)
                              ]),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30)),
                              boxShadow: [
                                BoxShadow(
                                  color: cl3E2501,
                                  blurRadius: 4,
                                  blurStyle: BlurStyle.normal,
                                  spreadRadius: 2,
                                )
                              ]),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Column(
                                children: [
                                  Text(
                                    value.eventsList[index].eventType,
                                    style: const TextStyle(
                                        color: clWhite,
                                        fontSize: 20,
                                        fontFamily: 'cantata',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 40),
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Date:',
                                          style: TextStyle(
                                              color: clWhite,
                                              fontFamily: 'cantata',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          value.eventsList[index].date,
                                          style: const TextStyle(
                                              color:clWhite,
                                              fontFamily: 'cantata',
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 40),
                                    child: Row(
                                      children: [
                                        const Text(
                                          'Time:',
                                          style: TextStyle(
                                              color: clWhite,
                                              fontFamily: 'cantata',
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          value.eventsList[index].time,
                                          style: const TextStyle(
                                              color: clWhite,
                                              fontFamily: 'cantata',
                                              fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Venu: ',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'cantata',
                                            color: clWhite,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        value.eventsList[index].venu,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: 'cantata',
                                            color: clWhite),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text('Topic: ',
                                          style: TextStyle(
                                              color: clWhite,
                                              fontFamily: 'cantata',
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(
                                          width: width / 1.6,
                                          child: Text(
                                              value.eventsList[index].topic,
                                              style: const TextStyle(
                                                  color: clWhite,
                                                  fontFamily: 'cantata',
                                                  fontSize: 14))),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Guests: ',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: clWhite,
                                            fontFamily: 'cantata',
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                          width: width / 1.6,
                                          child: Text(
                                            value.eventsList[index].gusets,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: clWhite,
                                                fontFamily: 'cantata'),
                                          )),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    );
                  }),
            );
          }),
        ],
      ),
    );
  }
}
