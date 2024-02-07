import 'package:bookish_beats/CONSTANT/myFunctions.dart';
import 'package:bookish_beats/PROVIDER/mainProvider.dart';
import 'package:bookish_beats/USER/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class signupPage extends StatelessWidget {
   signupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Image(image: AssetImage('assets/BBlogo.png')),
            ),

            ),
            Text('SignUp',style: TextStyle(color: Color(0xff3E2501),
                fontWeight: FontWeight.normal,fontSize: 32,fontFamily: 'cantata'),),
            SizedBox(height: 20),
            SizedBox(width:300,
              child: Consumer<mainProvider>(
                builder: (context,value,child) {
                  return TextField(
                    controller: value.userNumberController,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    decoration: InputDecoration(

                        hintText: "Enter your number",
                        prefixIcon: Icon(Icons.call,color: Color(0xff3E2501)),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                    ),
                  );
                }
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(width: 300,
              child: Consumer<mainProvider>(
                builder: (context,value,child) {
                  return TextField(
                    controller: value.userNameController,
                    decoration: InputDecoration(

                        hintText: "Enter your Name",
                        prefixIcon: Icon(Icons.person,color: Color(0xff3E2501)),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))

                    ),
                  );
                }
              ),
            ),
            SizedBox(height: 40,),
            Consumer<mainProvider>(
              builder: (context,value,child) {
                return InkWell(
                  onTap: (){
                    value.userSignup('',"NEW");
                    callNext(context, loginPage());
                  },
                  child: Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(color: Color(0xff3E2501),spreadRadius:10)],
                        color:Color(0xff3E2501) ),
                    child: Row(
                      children: [
                        Text('SignUp',style: TextStyle(fontFamily: 'cantata',fontSize: 24,color: Colors.white,fontWeight: FontWeight.normal)),
                        SizedBox(width: 20,),
                        Icon(Icons.login,color:Colors.white ,)
                      ],
                    ),


                  ),
                );
              }
            ),


            // Text('New user...?SignUp',style: TextStyle(color: ),)




          ],

        ),
      ),
    );
  }
}
