import 'package:flutter/material.dart';

class aboutPage extends StatelessWidget {
  aboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Column(
       children: [
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter,
                colors: [Color(0xff3E2704), Color(0xff9B5E02)],),

              ),
              
              child: Text(""),
              

            ),
          )
       ],
     ),
    );
  }
}
