import 'package:bookish_beats/USER/loginPage.dart';
import 'package:flutter/material.dart';

class firstPage extends StatelessWidget {
  firstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width*10,
                  height: 100,
                  color: Color(0xff3E2501),
                ),
                Positioned(top: 10,
                    left: 200,
                    child: Text('Find the book \n you like the \n     most..!',style: TextStyle(color: Colors.white,fontSize: 20,fontFamily:'cantata'),)),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: CircleAvatar(maxRadius: (80),
                    backgroundColor: Colors.white,backgroundImage: AssetImage('assets/Ellipse 1.png'),),
                ),



              ],
            ),
            SizedBox(height: 40,),
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 120),
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.5,
                    height: 130,
                    color: Color(0xff3E2501),
                  ),
                ),
                Positioned(
                  top: 20,
                    child: Text('     Are you a  \n passionate book \n    reviewer ?',style: TextStyle(
                      fontFamily: 'cantata',color: Colors.white,fontSize: 18
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 180,top: 30),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/pic1.png'))),

                  ),
                ),

              ],
            ),
            SizedBox(height: 30,),

            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 160),
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.8,
                    height: 130,
                    color: Color(0xff3E2501),
                    child: Center(
                      child: Text( '      Let’s \n   connect \n  with us..!',style: TextStyle(fontSize: 20,color: Colors.white,fontFamily:'cantata'),
                  ),
                    ),
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,top: 50),
                  child: Container(
                    width: 180,
                    height: 130,
                    decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/pic2.png'))),


                  ),
                ),

              ],

            ),
            SizedBox(height: 30,),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>loginPage()));
              },
              child: Container(
                width: 200,
                height: 40,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Color(0xff3E2501),spreadRadius:10)],
                color:Color(0xff3E2501) ),
                child: Center(child: Text('Explore Now',style: TextStyle(fontFamily: 'cantata',fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold))),

              ),
            )
          ],
        ),



      ),
    );
  }
}
