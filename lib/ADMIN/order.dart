import 'package:bookish_beats/ADMIN/adminHome.dart';
import 'package:flutter/material.dart';

class order extends StatelessWidget {
   order({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 60,
        flexibleSpace: Image.asset('assets/pic3.png',fit: BoxFit.fill,),
        bottom: PreferredSize(preferredSize: Size.fromHeight(3),
          child:Padding(
            padding: const EdgeInsets.only(bottom: 10),

          ),

        ),
        automaticallyImplyLeading: false,
        leading: InkWell(onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>adminHome()));
        },
            child: Icon(Icons.arrow_back,color: Colors.white)),
        title: Padding(
          padding: const EdgeInsets.only(left: 60),
          child: Text('Order ',style: TextStyle(fontFamily:'cantata' ,fontSize: 20,color: Colors.white)),
        ),


      ),
      body: Column(
        children: [

          Padding(
            padding: const EdgeInsets.only(top: 20,right: 110),
            child: Text('Delivery Address',style: TextStyle(fontFamily: 'cantata',fontSize: 18,color: Colors.black),),
          ),
          Center(
            child: Container(
              width: 330,
              height: 140,
              decoration: BoxDecoration(color: Color(0xff4b3a1f),borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 100,top: 10),
                    child: Text(' Athulya \n Palakkal(H) \n Sreekrishnapuram(P.O)\n Palakkad,679513 ',style: TextStyle(color: Colors.white,fontSize: 16,fontFamily: 'cantata'),),
                  ),

                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 20,right: 200),
            child: Text('Orders',style: TextStyle(fontFamily: 'cantata',fontSize: 18,color: Colors.black),),
          ),
          Container(
            width: 330,
            height: 140,
            decoration: BoxDecoration(color: Color(0xff4b3a1f),borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Image(image: AssetImage('assets/book3.jpg'),height: 100,),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10,top: 30),
                      child: Text("The Kite Runner",style: TextStyle(color: Colors.white,fontSize: 14,fontFamily: 'cantata'),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Row(
                        children: [
                          Icon(Icons.currency_rupee,color: Colors.black,size: 24,),
                          Text('380.00',style: TextStyle(fontFamily: 'cantata',fontSize: 16,color: Colors.white),)
                        ],
                      ),
                    ),

                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: ElevatedButton(

                      style:ElevatedButton.styleFrom(
                          backgroundColor:Color(0xffd1ad76),
                          elevation:5,
                          minimumSize: Size(70, 30)
                        // fixedSize:Size(110,6)
                      ),

                      onPressed:(){
                      } ,
                      child: Text("Proceed",style: TextStyle(fontSize: 14,color: Colors.black,fontFamily: 'cantata'),)),
                ),
              ],
            )
          ),


        ],
      ),
    );
  }
}
