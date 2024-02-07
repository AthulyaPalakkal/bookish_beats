import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

import '../PROVIDER/loginProvider.dart';

class otpPage extends StatelessWidget {

  otpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child:  Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Image(image: AssetImage('assets/BBlogo.png')),
              ),
            ),
            SizedBox(height: 10,),
            Text('Enter OTP',style: TextStyle(color: Color(0xff3E2501),
                fontWeight: FontWeight.normal,fontSize: 32,fontFamily: 'cantata'),),
            SizedBox(
              height: 20,
            ),
            Consumer<LoginProvider>(
                builder: (context,val,child) {
                  return Pinput(
                    controller:val.otpController,
                    length: 6,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    defaultPinTheme: PinTheme(
                        textStyle:
                        TextStyle(fontWeight: FontWeight.bold),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(width: 1,
                                color:Colors.black.withOpacity(0.9)))),
            
                    onCompleted: (pin){
                      val.verify(context,pin);
            
                    },
                  );
                }
            ),
            SizedBox(height: 100,),
            InkWell(onTap: (){

            },
              child: Container(
                width: 130,
                height: 40,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                    boxShadow: [BoxShadow(color: Color(0xff3E2501),spreadRadius:10)],
                    color:Color(0xff3E2501) ),
                child: Center(child: Text('Verify',style: TextStyle(fontFamily: 'cantata',fontSize: 28,color: Colors.white,fontWeight: FontWeight.normal))),
            
            
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
