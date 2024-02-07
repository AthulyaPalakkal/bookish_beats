import 'package:bookish_beats/USER/ReviewPage.dart';
import 'package:flutter/material.dart';

class viewReview extends StatelessWidget {
  viewReview({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff3E2501),
        body:Column(
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(right:300),
              // child: InkWell(onTap: (){
              //
              // },
              //     child: Icon(Icons.arrow_back_outlined,color: Colors.white,size: 32,)),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  CircleAvatar(
                    maxRadius: 22,backgroundImage: AssetImage('assets/profilepic.png'),
                  ),
                  SizedBox(width: 10,),
                  Text('Posted by Athulya',style: TextStyle(color: Colors.white,fontFamily: 'cantata',fontSize: 12),),
                  SizedBox(width: 130,),
                  Icon(Icons.thumb_up_alt_outlined,size: 30,color: Colors.white,)

                ],
              ),
            ),
            Center(child: Image(image: AssetImage('assets/book3.jpg'),height: 170)),
            SizedBox(
              height: 10,
            ),


            Expanded(

              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height/1.68,
                  decoration: BoxDecoration(color: Colors.white,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)
                    ),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 100,top: 10),
                        child: Text('The Kite Runner',style: TextStyle(color: Colors.black,
                            fontFamily: 'cantata',
                            fontSize: 22,fontWeight: FontWeight.bold),
                        ),
                      ),
                      Flexible(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10,top:10,right: 10),
                            child: Text('Completed this masterpiece by "Khaled Hosseini" and thinking how can a book be so emotional, '
                                'impactful and full of childhood memories. Actually i do not have words to describe the brilliance of this novel.'
                                ' Just with the starting i fell in love with each and every character of this novel. '
                                'This story of novel made me so emotional with its each and every turn and divergence and made me to realize the importance of the friends and people in your life you love the most.\n \n'
                                '  This novel took me to my childhood and made me to feel my childhood memories, kite running, true friendship, happiness, sadness, guilt, '
                                'frustration, hope, anger and innocence.I almost cried when Hassan and Ali was leaving the home in a rainy day and putting their belongings into a car trunk while Amir '
                                'was watching them from the window and Baba was crying.....that was the most tearful moment\n'
                                ,style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: 'cantata'),),
                          ),
                        ),
                      ),


                    ],
                  ),

                ),
              ),
            )



          ],
        ),
      ),
    );
  }
}
