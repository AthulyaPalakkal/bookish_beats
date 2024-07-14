import 'package:bookish_beats/ADMIN/adminHome.dart';
import 'package:bookish_beats/CONSTANT/myColor.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../MODELCLASS/modelcls.dart';
import '../PROVIDER/mainProvider.dart';

class bookotweek extends StatelessWidget {
  bookotweek({super.key});

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
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => adminHome()));
            },
            child: Icon(Icons.arrow_back, color: clWhite)),
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text('Add book of \n  the week',
              style: TextStyle(
                  fontFamily: 'gravitas', fontSize: 20, color: clWhite)),
        ),
      ),
      body: Consumer<mainProvider>(builder: (context, value, child) {
        return Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Center(
                // child: InkWell(
                //   onTap: (){
                //  showBottomSheet(context);
                //   },
                //   child:
                //   Container(
                //     width: 150,
                //     height: 170,
                //     decoration: BoxDecoration(color: Colors.black12,
                //         border: Border.all(color: Colors.black12),borderRadius: BorderRadius.circular(5)
                //     ),
                //     child:
                //     // Icon(Icons.add_a_photo_outlined,color: Colors.black54,size: 70),
                //   ),
                // ),

                ),
            SizedBox(
              width: 200,
              child: Consumer<mainProvider>(builder: (context, value, child) {
                return
                  Autocomplete<productadd>(
                  optionsBuilder: (TextEditingValue textEditingValue) {
                    return value.bookList
                        .where((productadd item) => item.bookname
                            .toLowerCase()
                            .contains(textEditingValue.text.toLowerCase()))
                        .toList();
                  },
                  displayStringForOption: (productadd bookoption) =>
                      bookoption.bookname,
                  fieldViewBuilder: (BuildContext context,
                      TextEditingController fieldTextEditingController,
                      FocusNode fieldFocusNode,
                      VoidCallback onFieldSubmitted) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      fieldTextEditingController.text =
                          value.bookNameController.text;
                    });

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 1.1,
                          child: TextFormField(
                            cursorColor: Colors.brown,
                            maxLines: 1,
                            style: const TextStyle(
                                color: clBlack,
                                fontWeight: FontWeight.w200),
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: clBlack),
                                  borderRadius: BorderRadius.circular(10)),
                              hintText: "Book Name",
                              hintStyle: const TextStyle(
                                  color: Colors.black45, fontFamily: 'cantata'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            onChanged: (txt) {},
                            controller: fieldTextEditingController,
                            focusNode: fieldFocusNode,
                          ),
                        ),
                      ),
                    );
                  },
                  onSelected: (productadd selection) {
                    value.bookNameController.text = selection.bookname;
                    value.booknameid = selection.productid;
                  },
                  optionsViewBuilder: (BuildContext context,
                      AutocompleteOnSelected<productadd> onSelected,
                      Iterable<productadd> options) {
                    return Align(
                      alignment: Alignment.topLeft,
                      child: Material(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(15)),
                          width: 200,
                          height: 200,
                          child: ListView.builder(
                            padding: const EdgeInsets.all(10.0),
                            itemCount: options.length,
                            itemBuilder: (BuildContext context, int index) {
                              final productadd bookoption =
                                  options.elementAt(index);

                              return GestureDetector(
                                onTap: () {
                                  onSelected(bookoption);
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          // border: Border(left: BorderSide(color: Colors.white,width: .6,
                                          // ))
                                          ),
                                      height: 30,
                                      width: 200,
                                      child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Text(bookoption.bookname,
                                                  style: const TextStyle(fontFamily: 'cantata',
                                                    color:clBlack,
                                                  )),
                                            ),
                                          ]),
                                    ),
                                    Divider(
                                      thickness: 1,
                                      color:clBlack,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            SizedBox(
              height: 70,
            ),
            InkWell(
              onTap: () {
                provider.addbookotweek();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => adminHome()));
              },
              child: Container(
                width: 150,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(color:cl3E2501, spreadRadius: 10)
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
    );
  }
}

void showBottomSheet(BuildContext context) {
  mainProvider provider = Provider.of<mainProvider>(context, listen: false);

  showModalBottomSheet(
      elevation: 10,
      backgroundColor:clWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
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
                    {provider.getImagecamera(), Navigator.pop(context)}),
            ListTile(
                leading: Icon(Icons.photo, color: clBlack),
                title: const Text(
                  'Gallery',
                ),
                onTap: () =>
                    {provider.getImagegallery(), Navigator.pop(context)}),
          ],
        );
      });
  //ImageSource
}
