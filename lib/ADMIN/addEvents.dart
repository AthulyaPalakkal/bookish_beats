import 'package:bookish_beats/ADMIN/viewEvents.dart';
import 'package:bookish_beats/CONSTANT/myColor.dart';
import 'package:bookish_beats/CONSTANT/myFunctions.dart';
import 'package:bookish_beats/PROVIDER/mainProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class addEvents extends StatelessWidget {
  addEvents({super.key});

  @override
  Widget build(BuildContext context) {
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
        automaticallyImplyLeading: false,
        leading: const Icon(Icons.arrow_back, color: clWhite),
        title: const Padding(
          padding: EdgeInsets.only(left: 50),
          child: Text('Add Events',
              style: TextStyle(
                  fontFamily: 'cantata', fontSize: 20, color: clWhite)),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Consumer<mainProvider>(builder: (context, value, child) {
            return Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Event Details',
                    style: TextStyle(
                        color: clBlack, fontSize: 18, fontFamily: 'cantata'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 200),
                  child: Text(
                    'Event type:',
                    style: TextStyle(
                        color: clBlack, fontFamily: 'cantata', fontSize: 16),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: TextField(
                    controller: value.eventTypeController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                              child: const Padding(
                            padding: EdgeInsets.only(right: 80),
                            child: Text(
                              'Date:',
                              style: TextStyle(
                                  color: clBlack,
                                  fontFamily: 'cantata',
                                  fontSize: 16),
                            ),
                          )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: TextField(
                              controller: value.dateController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 80),
                            child: Text(
                              'Time:',
                              style: TextStyle(
                                  color: clBlack,
                                  fontFamily: 'cantata',
                                  fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2.5,
                            child: TextField(
                              controller: value.timeController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 260),
                  child: Text(
                    'Venu:',
                    style: TextStyle(
                        color: clBlack, fontFamily: 'cantata', fontSize: 16),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: TextField(
                    controller: value.venuController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 260),
                  child: Text(
                    'Topic:',
                    style: TextStyle(
                        color: clBlack, fontFamily: 'cantata', fontSize: 16),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: TextField(
                    controller: value.topicController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 260),
                  child: Text(
                    'Guests:',
                    style: TextStyle(
                        color: clBlack, fontFamily: 'cantata', fontSize: 16),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: TextField(
                    controller: value.guestController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    value.addevents();
                    value.getEvents();
                    callNext(context, viewEvents());
                  },
                  child: Container(
                    width: 150,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          const BoxShadow(color: cl3E2501, spreadRadius: 10)
                        ],
                        color: cl3E2501),
                    child: const Center(
                        child: Text('Save',
                            style: TextStyle(
                                fontFamily: 'cantata',
                                fontSize: 22,
                                color: clWhite,
                                fontWeight: FontWeight.bold))),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
