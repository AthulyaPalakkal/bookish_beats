import 'package:bookish_beats/CONSTANT/myColor.dart';
import 'package:flutter/material.dart';

class userList extends StatelessWidget {
  userList({super.key});

  List<String> username = ["anu", "Athulya", "anu"];

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
          child: Text('User List',
              style: TextStyle(
                  fontFamily: 'cantata', fontSize: 20, color: clWhite)),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              width: 290,
              height: 70,
              decoration: BoxDecoration(
                  color: const Color(0xff4b3a1f),
                  borderRadius: BorderRadius.circular(10)),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 140, top: 10),
                    child: Text(
                      'Name: Anu ',
                      style: TextStyle(
                          color: clWhite,
                          fontSize: 16,
                          fontFamily: 'cantata'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 50),
                    child: Text(
                      'Number: 9876564532',
                      style: TextStyle(
                          color: clWhite,
                          fontSize: 16,
                          fontFamily: 'cantata'),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 290,
            height: 70,
            decoration: BoxDecoration(
                color: const Color(0xff4b3a1f),
                borderRadius: BorderRadius.circular(10)),
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 110, top: 10),
                  child: Text(
                    'Name: Athulya ',
                    style: TextStyle(
                        color: clWhite,
                        fontSize: 16,
                        fontFamily: 'cantata'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 50),
                  child: Text(
                    'Number: 8301018665',
                    style: TextStyle(
                        color: clWhite,
                        fontSize: 16,
                        fontFamily: 'cantata'),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 290,
            height: 70,
            decoration: BoxDecoration(
                color: const Color(0xff4b3a1f),
                borderRadius: BorderRadius.circular(10)),
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 140, top: 10),
                  child: Text(
                    'Name: Anu ',
                    style: TextStyle(
                        color: clWhite,
                        fontSize: 16,
                        fontFamily: 'cantata'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 50),
                  child: Text(
                    'Number: 9876564532',
                    style: TextStyle(
                        color: clWhite,
                        fontSize: 16,
                        fontFamily: 'cantata'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
