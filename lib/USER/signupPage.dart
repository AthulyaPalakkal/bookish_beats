import 'package:bookish_beats/CONSTANT/myColor.dart';
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
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.only(top: 70),
                child: Image(image: AssetImage('assets/BBlogo.png')),
              ),
            ),
            const Text(
              'SignUp',
              style: TextStyle(
                  color: cl3E2501,
                  fontWeight: FontWeight.normal,
                  fontSize: 32,
                  fontFamily: 'cantata'),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: Consumer<mainProvider>(builder: (context, value, child) {
                return TextField(
                  controller: value.userNumberController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [LengthLimitingTextInputFormatter(10)],
                  decoration: InputDecoration(
                      hintText: "Enter your number",
                      prefixIcon: const Icon(Icons.call, color: cl3E2501),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                );
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              child: Consumer<mainProvider>(builder: (context, value, child) {
                return TextField(
                  controller: value.userNameController,
                  decoration: InputDecoration(
                      hintText: "Enter your Name",
                      prefixIcon: const Icon(Icons.person, color: cl3E2501),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                );
              }),
            ),
            const SizedBox(
              height: 40,
            ),
            Consumer<mainProvider>(builder: (context, value, child) {
              return InkWell(
                onTap: () {
                  value.userSignup('', "NEW");
                  callNext(context, loginPage());
                },
                child: Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        const BoxShadow(color: cl3E2501, spreadRadius: 10)
                      ],
                      color: cl3E2501),
                  child: const Row(
                    children: [
                      Text('SignUp',
                          style: TextStyle(
                              fontFamily: 'cantata',
                              fontSize: 24,
                              color: clWhite,
                              fontWeight: FontWeight.normal)),
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

            // Text('New user...?SignUp',style: TextStyle(color: ),)
          ],
        ),
      ),
    );
  }
}
