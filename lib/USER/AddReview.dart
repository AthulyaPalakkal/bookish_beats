import 'package:bookish_beats/CONSTANT/myColor.dart';
import 'package:bookish_beats/CONSTANT/myFunctions.dart';
import 'package:bookish_beats/USER/ReviewPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../PROVIDER/mainProvider.dart';

class AddReview extends StatelessWidget {
  AddReview({super.key});

  @override
  Widget build(BuildContext context) {
    mainProvider provider = Provider.of<mainProvider>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          flexibleSpace: Image.asset(
            'assets/pic3.png',
            fit: BoxFit.fill,
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(3),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
            ),
          ),
          automaticallyImplyLeading: false,
          leading: InkWell(
              onTap: () {
                back(context);
              },
              child: Icon(Icons.arrow_back, color: clWhite)),
          title: Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text('Write Review',
                style: TextStyle(
                    fontFamily: 'cantata', fontSize: 20, color: clWhite)),
          ),
        ),
        body: SingleChildScrollView(
          child: Consumer<mainProvider>(builder: (context, value, child) {
            return Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: InkWell(
                      onTap: () {
                        showBottomSheet(context);
                      },
                      child: value.filereviewimage != null
                          ? Container(
                              width: 150,
                              height: 170,
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  border: Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Image.file(
                                value.filereviewimage!,
                                fit: BoxFit.fill,
                              ))
                          : Container(
                              width: 150,
                              height: 170,
                              decoration: BoxDecoration(
                                  color: Colors.black12,
                                  border: Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(5)),
                              child: Icon(Icons.add_a_photo_outlined,
                                  color: Colors.black54, size: 70),
                            )),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: TextField(
                    controller: value.reviewController,
                    maxLines: 5,
                    decoration: InputDecoration(
                        hintText: "Write here",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                InkWell(
                  onTap: () {
                    provider.addrreview();

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ReviewPage()));
                  },
                  child: Container(
                    width: 150,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(color: cl3E2501, spreadRadius: 10)
                        ],
                        color: cl3E2501),
                    child: Center(
                        child: Text('Submit',
                            style: TextStyle(
                                fontFamily: 'cantata',
                                fontSize: 22,
                                color: clWhite,
                                fontWeight: FontWeight.bold))),
                  ),
                )
              ],
            );
          }),
        ));
  }
}

void showBottomSheet(BuildContext context) {
  mainProvider provider = Provider.of<mainProvider>(context, listen: false);

  showModalBottomSheet(
      elevation: 10,
      backgroundColor: clWhite,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      )),
      context: context,
      builder: (BuildContext bc) {
        return Wrap(
          children: <Widget>[
            ListTile(
                leading: Icon(
                  Icons.camera_enhance_sharp,
                  color: Colors.black54,
                ),
                title: const Text(
                  'Camera',
                ),
                onTap: () =>
                    {provider.getReviewImagecamera(), Navigator.pop(context)}),
            ListTile(
                leading: Icon(Icons.photo, color: clBlack),
                title: const Text(
                  'Gallery',
                ),
                onTap: () =>
                    {provider.getReviewImagegallery(), Navigator.pop(context)}),
          ],
        );
      });
  //ImageSource
}
