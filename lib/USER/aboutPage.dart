import 'package:bookish_beats/CONSTANT/myColor.dart';
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
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  colors: [cl3E2704, cl9B5E02],
                ),
              ),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 40, left: 10, right: 10),
                  child: Text(
                      "Bookish Beats is a revolutionary Flutter-powered mobile application that "
                      "seamlessly integrates book sales with a vibrant user review community."
                      "The app not only offers a rich e-commerce experience for book "
                      "purchases but also provides users with a platform to share and explore "
                      "insightful reviews from fellow readers. and it organizes and promotes "
                      "various book-related events to foster a dynamic reading culture.",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'cantata')),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
