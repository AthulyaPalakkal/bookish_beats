import 'package:bookish_beats/ADMIN/addEvents.dart';
import 'package:bookish_beats/CONSTANT/myColor.dart';
import 'package:bookish_beats/CONSTANT/myFunctions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../PROVIDER/mainProvider.dart';

class viewEvents extends StatelessWidget {
  viewEvents({super.key});
  List<String> evlist = [];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    mainProvider provider = Provider.of<mainProvider>(context, listen: false);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: cl3E2501,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => addEvents()));
        },
        child: const Icon(Icons.add, color: clWhite),
      ),
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
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: () {
              provider.getEvents();
              back(context);
            },
            child: const Icon(Icons.arrow_back, color: clWhite)),
        title: const Padding(
          padding: EdgeInsets.only(left: 50),
          child: Text('Add Events',
              style: TextStyle(
                  fontFamily: 'cantata', fontSize: 20, color: clWhite)),
        ),
      ),
      body: Consumer<mainProvider>(builder: (context, value, child) {
        return ListView.builder(
            // padding: EdgeInsets.all(15),
            // scrollDirection: Axis.vertical,
            itemCount: value.eventsList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: Consumer<mainProvider>(builder: (context, value, child) {
                  return GestureDetector(
                    onLongPress: () {
                      showDialog(
                          context: context,
                          builder: (abc) => AlertDialog(
                                content: const Text("Delete or Edit",
                                    style: TextStyle(
                                        color:clBlack,
                                        fontFamily: 'cantata',
                                        fontSize: 15)),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        value.deleteEvents(context,
                                            value.eventsList[index].id);
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Delete")),
                                  TextButton(
                                      onPressed: () {
                                        (context, value.eventsList[index].id);
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Edit"))
                                ],
                              ));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.1,
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: BoxDecoration(
                          color: cl3E2501,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: const [
                            BoxShadow(
                                color: cl3E2501,
                                blurRadius: 5,
                                blurStyle: BlurStyle.solid,
                                spreadRadius: 5)
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
                                          fontSize: 16),
                                    ),
                                    Text(
                                      value.eventsList[index].date,
                                      style: const TextStyle(
                                          color: clWhite,
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
                                          fontSize: 16),
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
                                        color: clWhite),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Topic: ',
                                      style: TextStyle(
                                          color: clWhite,
                                          fontFamily: 'cantata',
                                          fontSize: 14)),
                                  SizedBox(
                                      width: width / 1.6,
                                      child: Text(value.eventsList[index].topic,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Guests: ',
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: clWhite,
                                        fontFamily: 'cantata'),
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
                    ),
                  );
                }),
              );
            });
      }),
    );
  }
}
