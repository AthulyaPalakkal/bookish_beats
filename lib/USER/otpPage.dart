import 'package:bookish_beats/CONSTANT/myColor.dart';
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
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Image(image: AssetImage('assets/BBlogo.png')),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Enter OTP',
              style: TextStyle(
                  color: cl3E2501,
                  fontWeight: FontWeight.normal,
                  fontSize: 22,
                  fontFamily: 'cantata'),
            ),
            SizedBox(
              height: 40,
            ),
            Consumer<LoginProvider>(builder: (context, val, child) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Pinput(
                  controller: val.otpController,
                  length: 6,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  defaultPinTheme: PinTheme(
                      textStyle: TextStyle(fontWeight: FontWeight.bold),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: clWhite,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              width: 1, color: Colors.black.withOpacity(0.9)))),
                  onCompleted: (pin) {
                    val.verify(context, pin);
                  },
                ),
              );
            }),
            SizedBox(
              height: 100,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 260,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(color: cl3E2501, spreadRadius: 10)],
                    color: cl3E2501),
                child: Center(
                    child: Text('Verify',
                        style: TextStyle(
                            fontFamily: 'cantata',
                            fontSize: 20,
                            color: clWhite,
                            fontWeight: FontWeight.normal))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
