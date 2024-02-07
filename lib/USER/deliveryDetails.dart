import 'package:bookish_beats/CONSTANT/myFunctions.dart';
import 'package:flutter/material.dart';

class deliveryDetails extends StatelessWidget {
  deliveryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(toolbarHeight: 80,
          flexibleSpace: Image.asset('assets/pic3.png',fit: BoxFit.fill,),
          automaticallyImplyLeading: false,
          leading: InkWell(
            onTap: (){
              back(context);
            },
              child: Icon(Icons.arrow_back,color: Colors.white,size: 22)),
          title: Text('Delivery Details',style: TextStyle(fontFamily:'Cantata' ,fontSize: 20,color: Colors.white)),
        ),
        body: Column(
          children: [
            SizedBox(height: 30,),
            Center(
              child: Container(
                width: 300,
                height: 450,
                decoration: BoxDecoration(
                  gradient:  LinearGradient(begin: Alignment.bottomCenter,
                    colors: [Color(0xff3E2704), Color(0xff9B5E02)],),borderRadius: BorderRadius.circular(20),
                  boxShadow: [BoxShadow(color: Color(0xff3E2501),blurRadius: 10,
                      blurStyle: BlurStyle.normal, spreadRadius: 1)],
                ),
                child: Center(
                  child: Column(
                    children: [
                      Text('Delivery Address',style: TextStyle(color: Colors.white,fontFamily: 'cantata',fontSize: 20),),
                      SizedBox(height: 10,),
                      Container(
                        width: 270,
                        height: 100,
                        decoration: BoxDecoration(
                          color:Color(0xff3E2501),borderRadius: BorderRadius.circular(10)
                        ),
                        child:Text(' Athulya \n Palakkal(H)\n Sreekrishnapuram(p.o) \n Palakkad',style: TextStyle(color: Colors.white,fontFamily: 'cantata',fontSize:16),),
                      ),
                      SizedBox(height: 10,),
                      Text('Payment Details',style: TextStyle(color: Colors.white,fontFamily: 'cantata',fontSize: 20),),
                      Container(
                        width: 270,
                        height: 40,
                        decoration: BoxDecoration(
                            color:Color(0xff3E2501),borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.account_balance_outlined,size: 28,color: Colors.white,),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('Net Banking',style: TextStyle(color: Colors.white,fontFamily: 'cantata',fontSize: 16),),
                            ),


                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        width: 270,
                        height: 40,
                        decoration: BoxDecoration(
                            color:Color(0xff3E2501),borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.credit_card_outlined,size: 28,color: Colors.white,),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('Debit/Credit card',style: TextStyle(color: Colors.white,fontFamily: 'cantata',fontSize: 16),),
                            ),


                          ],
                        ),
                      ),
                      SizedBox(height: 10,),

                      Container(
                        width: 270,
                        height: 40,
                        decoration: BoxDecoration(
                            color:Color(0xff3E2501),borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: [
                            Image(image: AssetImage('assets/icons.png')),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('UPI - Google Pay',style: TextStyle(color: Colors.white,fontFamily: 'cantata',fontSize: 16),),
                            ),


                          ],
                        ),
                      ),
                      SizedBox(height: 10,),

                      Container(
                        width: 270,
                        height: 40,
                        decoration: BoxDecoration(
                            color:Color(0xff3E2501),borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: [
                            Image(image: AssetImage('assets/icons2.png')),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text('UPI - PayTM',style: TextStyle(color: Colors.white,fontFamily: 'cantata',fontSize: 16),),
                            ),


                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      ElevatedButton(

                          style:ElevatedButton.styleFrom(
                              backgroundColor:Colors.red,
                              elevation:5,
                              minimumSize: Size(160, 40)
                            // fixedSize:Size(110,6)
                          ),

                          onPressed:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>deliveryDetails()));

                          } ,
                          child: Text("Pay Now",style: TextStyle(fontSize: 14,color: Colors.white,fontFamily: 'cantata'),)),


                    ],
                  ),
                ),
              ),


            ),
            SizedBox(height: 30,),
            Container(
              width: 300,
              height: 70,
              decoration: BoxDecoration(
                  color:Colors.white70,borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Color(0xff3E2501),blurRadius: 5,
                      blurStyle: BlurStyle.outer, spreadRadius: 5)]
              ),
              child:Text('Order can be tracked by your \nnumber. \nTracking link is shared via SMS ',style: TextStyle(color: Colors.black,fontFamily: 'cantata',fontSize:16),),
            ),

          ],
        ),

      ),
    );
  }
}
