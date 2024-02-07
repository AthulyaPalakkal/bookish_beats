import 'dart:developer';

import 'package:bookish_beats/ADMIN/adminHome.dart';
import 'package:bookish_beats/PROVIDER/mainProvider.dart';
import 'package:bookish_beats/USER/otpPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../BOTNAVBAR/navigationBar.dart';
import '../CONSTANT/myFunctions.dart';

class LoginProvider extends ChangeNotifier{

  FirebaseAuth auth=FirebaseAuth.instance;
  FirebaseFirestore db= FirebaseFirestore.instance;

  String VerificationId ="";
  bool loader=false;

  TextEditingController phoneController=TextEditingController();
  TextEditingController otpController=TextEditingController();

  void sendOtp (BuildContext context) async{
    loader=true;
    notifyListeners();
    await auth.verifyPhoneNumber(
      phoneNumber: "+91${phoneController.text}",
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
          backgroundColor: Colors.white,
          content: Text(
              "Verification Completed",
              style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w800,)),
          duration:
          Duration(milliseconds: 3000),
        ));
        if (kDebugMode) {}
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == "invalid-phone-number") {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(
            content:
                  Text("Sorry, Verification Failed"),
            duration: Duration(milliseconds: 3000),
          ));
          if (kDebugMode) {

          }

        }
      },

      codeSent: (String verificationId, int? resendToken) {
        VerificationId = verificationId;
        loader= false;
        notifyListeners();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => otpPage(),
            ));
        ScaffoldMessenger.of(context).showSnackBar( const SnackBar(
          backgroundColor: Colors.white,
          content: Text(
              "OTP sent to phone successfully",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600,)),
          duration:
          Duration(milliseconds: 3000),
        ));
        phoneController.clear();
        log("Verification Id : $verificationId");

      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      timeout: const Duration(seconds: 60),
    );
  }

  void verify(BuildContext context,String pin) async {

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: VerificationId, smsCode: pin);
    print(otpController.text.toString()+"ooooo");
    try{
      await auth.signInWithCredential(credential).then((value) {
        final user = value.user;
        if(user!= null){
          print(user.phoneNumber!+"sdbjhdbs");
          userAuthorized(user.phoneNumber,context);
        }else{
          if(kDebugMode){

          }
        }



      });
    }catch(e){
      print(e.toString()+' JNCKSJ');
    }

  }
  Future<void> userAuthorized(String? phoneNumber, BuildContext context) async {

    String loginUsername='';
    String loginUsertype='';
    String loginUserid='';
    String userId='';
    String loginphno="";
    String loginPhoto="";
    String address="";


    try {
      var phone = phoneNumber!;
      print(phoneNumber.toString()+"duudud");
      db.collection("USERS").where("PHONE",isEqualTo:phone).get().then((value) {
        if(value.docs.isNotEmpty){
          print("fiifuif");
          for(var element in value.docs) {
            Map<dynamic, dynamic> map = element.data();
            loginUsername = map['NAME'].toString();
            loginUsertype = map['TYPE'].toString();
            loginphno=map["PHONE"].toString();
            loginUserid = element.id;
            userId=map["USER_ID"].toString();

            String uid = userId;
            print(loginUsertype);
            if (loginUsertype == "ADMIN") {

              print("cb bcb");
              callNextReplacement(context, adminHome(),);

            }

            else {
              print("mxnxn");
              mainProvider provider = Provider.of<mainProvider>(context,listen: false);
              provider.getReview();
              provider.getCatgoryData();
              provider.getEvents();
              provider.getuser(userId);
              notifyListeners();
              print(userId+"yyyyyyyyyyyyyy");


              callNextReplacement(context,Bottombar(userId: userId,),);


              print("dkdkdd");

            }
          }

        }
        else {
          const snackBar = SnackBar(
              backgroundColor: Colors.white,
              duration: Duration(milliseconds: 3000),
              content: Text("Sorry , You don't have any access",
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ));

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }

      });


    } catch (e) {


      // const snackBar = SnackBar(
      //     backgroundColor: Colors.white,
      //     duration: Duration(milliseconds: 3000),
      //     content: Text("Sorry , Some Error Occurred",
      //       textAlign: TextAlign.center,
      //       softWrap: true,
      //       style: TextStyle(
      //           fontSize: 18,
      //           color: Colors.black,
      //           fontWeight: FontWeight.bold),
      //     ));
      // ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}




