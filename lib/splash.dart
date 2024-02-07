import 'dart:async';

import 'package:bookish_beats/CONSTANT/myFunctions.dart';
import 'package:bookish_beats/USER/firstPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'PROVIDER/loginProvider.dart';
import 'PROVIDER/mainProvider.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    LoginProvider loginProvider =
    Provider.of<LoginProvider>(context, listen: false);
    mainProvider MainProvider =
    Provider.of<mainProvider>(context, listen: false);


    FirebaseAuth auth = FirebaseAuth.instance;
    var loginUser = auth.currentUser;
    Timer( Duration(seconds: 4), () {
      // callNextReplacement(context,  firstPage());
      if(loginUser==null){
        callNextReplacement(context,  firstPage());


      }else{
        loginProvider.userAuthorized(loginUser.phoneNumber, context);

      }

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        body:Padding(
          padding: const EdgeInsets.only(top: 45),
          child: Center(child: Image.asset("assets/BookishBeatslogo.png")),
        )


    );
  }
}