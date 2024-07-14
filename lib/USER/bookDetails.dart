import 'package:bookish_beats/CONSTANT/myColor.dart';
import 'package:bookish_beats/CONSTANT/myFunctions.dart';
import 'package:bookish_beats/USER/deliveryDetails.dart';
import 'package:bookish_beats/USER/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class bookDetails extends StatelessWidget {
  bookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: cl3E2501,
      body: Column(
        children: [
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(right:300),
            child: InkWell(onTap: (){
              back(context);
            },
                child: Icon(Icons.arrow_back_outlined,color: clWhite,size: 32,)),
          ),
          SizedBox(height: 20,),
          Center(child: Image(image: AssetImage('assets/book1.jpg'),height: 170)),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 150),
            child: Text('Book : RAM C/O ANANDHI',style: TextStyle(color: clWhite,fontSize: 12,fontFamily: 'cantata',),),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(right: 150),
            child: Text('Author : Akhil P Dharmajan',style: TextStyle(color: clWhite,fontSize: 12,fontFamily: 'cantata',),),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.only(right: 220),
            child: Text('Category : Novel',style: TextStyle(color: clWhite,fontSize: 12,fontFamily: 'cantata',),),
          ),

          Expanded(

            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/1.86,
                decoration: BoxDecoration(color: clWhite,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)
                    ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 100,top: 10),
                      child: Text('Book Summary',style: TextStyle(color: clBlack,
                          fontFamily: 'cantata',
                          fontSize: 22,fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,top:10,right: 10),
                      child: Text('ഒരു സിനിമാറ്റിക് നോവൽ.ചെന്നൈ നഗരം പശ്ചാത്തലമാക്കി എഴുതിയ ഫീൽ ഗുഡ് സിനിമ പോലൊരു നോവൽ. '
                          'പ്രണയം, സൗഹൃദം, യാത്ര, പ്രതികാരം, രാഷ്ട്രീയം തുടങ്ങി വായനയെ രസമുള്ളതാക്കുന്ന എല്ലാ ചേരുവകളും ചേർത്തെഴുതിയ ഈ രചന അനവധി കഥകളും ട്വിസ്റ്റുകളും നിറഞ്ഞതാണ്.'
                          ' ',style: TextStyle(fontSize: 15,color:clBlack,fontFamily: 'cantata'),),
                    ),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(right: 200),
                      child: Image(image:AssetImage('assets/group7.png'),height: 25,),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Icon(Icons.currency_rupee,color: Color(0xff4a3211),size: 30),
                          Text('335.00',style: TextStyle(fontFamily: 'cantata',fontSize: 22,color: clBlack),),


                        ],
                      ),
                    ),
                    ElevatedButton(

                        style:ElevatedButton.styleFrom(
                            backgroundColor:cl3E2501,
                            elevation:5,
                            minimumSize: Size(120, 40)
                          // fixedSize:Size(110,6)
                        ),

                        onPressed:(){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>deliveryDetails()));

                        } ,
                        child: Text("Buy Now",style: TextStyle(fontSize: 14,color: clWhite,fontFamily: 'cantata'),)),
                  ],
                ),

              ),
            ),
          )



        ],
      ),
    ));
  }
}
