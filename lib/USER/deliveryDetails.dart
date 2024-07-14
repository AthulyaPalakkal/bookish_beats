import 'package:bookish_beats/CONSTANT/myColor.dart';
import 'package:bookish_beats/CONSTANT/myFunctions.dart';
import 'package:flutter/material.dart';

class deliveryDetails extends StatelessWidget {
  deliveryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: clWhite,
        appBar: AppBar(
          toolbarHeight: 80,
          flexibleSpace: Image.asset(
            'assets/pic3.png',
            fit: BoxFit.fill,
          ),
          automaticallyImplyLeading: false,
          leading: InkWell(
              onTap: () {
                back(context);
              },
              child: const Icon(Icons.arrow_back, color: clWhite, size: 22)),
          title: Text('Delivery Details',
              style: TextStyle(
                  fontFamily: 'Cantata', fontSize: 20, color: clWhite)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  width: 300,
                  height: 500,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.bottomCenter,
                      colors: [cl3E2704, cl9B5E02],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      const BoxShadow(
                          color: cl3E2501,
                          blurRadius: 10,
                          blurStyle: BlurStyle.normal,
                          spreadRadius: 1)
                    ],
                  ),
                  child: Center(
                    child: Column(
                      children: [
                        const Text(
                          'Delivery Address',
                          style: TextStyle(
                              color: clWhite,
                              fontFamily: 'cantata',
                              fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Container(
                        //   width: 270,
                        //   height: 100,
                        //   decoration: BoxDecoration(
                        //     color:Color(0xff3E2501),borderRadius: BorderRadius.circular(10)
                        //   ),
                        //   child:Text(' Athulya \n Palakkal(H)\n Sreekrishnapuram(p.o) \n Palakkad',style: TextStyle(color: Colors.white,fontFamily: 'cantata',fontSize:16),),
                        // ),
                        TextField(
                          style: const TextStyle(
                            color: clBlack,
                          ),
                          maxLines: 4,
                          decoration: InputDecoration(
                            labelText: 'Address',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            filled: true,
                            fillColor: cl3E2501,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'Payment Details',
                          style: TextStyle(
                              color: clWhite,
                              fontFamily: 'cantata',
                              fontSize: 20),
                        ),
                        Container(
                          width: 270,
                          height: 40,
                          decoration: BoxDecoration(
                              color: cl3E2501,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.account_balance_outlined,
                                size: 28,
                                color: clWhite,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Net Banking',
                                  style: TextStyle(
                                      color: clWhite,
                                      fontFamily: 'cantata',
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 270,
                          height: 40,
                          decoration: BoxDecoration(
                              color: cl3E2501,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Row(
                            children: [
                              Icon(
                                Icons.credit_card_outlined,
                                size: 28,
                                color: clWhite,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'Debit/Credit card',
                                  style: TextStyle(
                                      color: clWhite,
                                      fontFamily: 'cantata',
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        Container(
                          width: 270,
                          height: 40,
                          decoration: BoxDecoration(
                              color: cl3E2501,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Row(
                            children: [
                              Image(image: AssetImage('assets/icons.png')),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'UPI - Google Pay',
                                  style: TextStyle(
                                      color: clWhite,
                                      fontFamily: 'cantata',
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        Container(
                          width: 270,
                          height: 40,
                          decoration: BoxDecoration(
                              color: cl3E2501,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Row(
                            children: [
                              Image(image: AssetImage('assets/icons2.png')),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text(
                                  'UPI - PayTM',
                                  style: TextStyle(
                                      color:clWhite,
                                      fontFamily: 'cantata',
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                elevation: 5,
                                minimumSize: const Size(160, 40)
                                // fixedSize:Size(110,6)
                                ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => deliveryDetails()));
                            },
                            child: const Text(
                              "Pay Now",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: clWhite,
                                  fontFamily: 'cantata'),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 300,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      const BoxShadow(
                          color: cl3E2501,
                          blurRadius: 5,
                          blurStyle: BlurStyle.outer,
                          spreadRadius: 5)
                    ]),
                child: const SizedBox(
                    child: Text(
                  'Order can be tracked by your number. Tracking link is shared via SMS ',
                  style: TextStyle(
                      color: clBlack, fontFamily: 'cantata', fontSize: 16),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
