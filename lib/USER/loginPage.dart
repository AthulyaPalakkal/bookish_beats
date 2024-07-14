import 'package:bookish_beats/PROVIDER/loginProvider.dart';
import 'package:bookish_beats/USER/signupPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../CONSTANT/myColor.dart';

class loginPage extends StatelessWidget {
  loginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: clWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Image(image: AssetImage('assets/BBlogo.png')),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: cl3E2501,
                  fontWeight: FontWeight.normal,
                  fontSize: 32,
                  fontFamily: 'cantata'),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: 300,
              height: 60,
              child: Consumer<LoginProvider>(builder: (context, value, child) {
                return TextField(
                  controller: value.phoneController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  decoration: InputDecoration(
                      hintText: "Enter your number",
                      prefixIcon: Icon(Icons.call, color: cl3E2501),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                );
              }),
            ),
            SizedBox(
              height: 40,
            ),
            Consumer<LoginProvider>(builder: (context, value, child) {
              return value.loader
                  ? CircularProgressIndicator(
                      color: clBlack,
                    )
                  : InkWell(
                      onTap: () {
                        value.sendOtp(context);
                        print("addfjhlkjdhgsdfyueui");
                      },
                      child: Container(
                        width: 230,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(color: cl3E2501, spreadRadius: 10)
                            ],
                            color: cl3E2501),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 60),
                              child: Text('Login',
                                  style: TextStyle(
                                      fontFamily: 'cantata',
                                      fontSize: 20,
                                      color: clWhite,
                                      fontWeight: FontWeight.normal)),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.login,
                              color: clWhite,
                            )
                          ],
                        ),
                      ),
                    );
            }),
            SizedBox(
              height: 60,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => signupPage()));
              },
              child: RichText(
                text: const TextSpan(
                  text: 'New User...?',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Color(0xffbfb374),
                      fontFamily: 'cantata'),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'SignUp',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: cl3E2501)),
                  ],
                ),
              ),
            )
            // Text('New user...?SignUp',style: TextStyle(color: ),)
          ],
        ),
      ),
    );
  }
}
