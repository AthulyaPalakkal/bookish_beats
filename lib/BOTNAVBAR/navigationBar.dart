import 'package:bookish_beats/CONSTANT/myColor.dart';
import 'package:bookish_beats/PROVIDER/mainProvider.dart';
import 'package:bookish_beats/USER/eventsPage.dart';
import 'package:bookish_beats/USER/home.dart';
import 'package:bookish_beats/USER/profilePage.dart';
import 'package:bookish_beats/USER/ReviewPage.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bottombar extends StatefulWidget {
  final String userId;
  // final String loginphno;
  // final String loginUsername;

  Bottombar({
    required this.userId,
    // required this.loginphno,
    // required this.loginUsername,
    Key? key,
  }) : super(key: key);

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {

  int selectedIndex = 0;

  @override
  void _itemTapped(int index){
    setState(() {
      selectedIndex = index;
      print(selectedIndex.toString()+"ppkk");
    });

  }

  @override
  Widget build(BuildContext context) {

    var pages = [
      home(),
      eventsPage(),
      ReviewPage(),
      // notificationPage(),
      profilePage(userId: widget.userId,)


    ];

    print(selectedIndex.toString()+"ijkjkj");
    return Scaffold(
      body: pages[selectedIndex],
      extendBody: true,
      bottomNavigationBar:  Consumer<mainProvider>(
        builder: (context,value,child) {
          return DotNavigationBar(
            margin: EdgeInsets.zero,marginR: EdgeInsets.zero,paddingR: EdgeInsets.zero,
            // enableFloatingNavBar: true,
            selectedItemColor: clWhite,
            unselectedItemColor: Color(0xff988A9A),
            backgroundColor: cl3E2501,
            currentIndex: selectedIndex,

            onTap: _itemTapped,
            items: [
              DotNavigationBarItem(
                icon: Icon(Icons.home),
              ),
              DotNavigationBarItem(
                icon: Icon(Icons.event),

              ),
              DotNavigationBarItem(
                icon: Icon(Icons.edit),

              ),
              // DotNavigationBarItem(
              //   icon: Icon(Icons.notifications),
              //
              // ),
              DotNavigationBarItem(
                icon: value.profileimage.isNotEmpty? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CircleAvatar(backgroundColor:cld9d9d9,
                      maxRadius: 15,backgroundImage: NetworkImage(value.profileimage!)
                  ),
                ): CircleAvatar(backgroundColor:cld9d9d9,
                  maxRadius: 15,child: Icon(Icons.person),
                ),
                // Icon(Icons.account_circle),

              ),
            ],

          );
        }
      ),
    );
  }
}