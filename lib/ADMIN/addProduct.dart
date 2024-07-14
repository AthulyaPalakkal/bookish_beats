import 'package:bookish_beats/ADMIN/viewProduct.dart';
import 'package:bookish_beats/CONSTANT/myColor.dart';
import 'package:bookish_beats/PROVIDER/mainProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../MODELCLASS/modelcls.dart';
import 'adminHome.dart';

class addProduct extends StatelessWidget {
  String frmId;
  String toId;

  addProduct({super.key, required this.frmId, required this.toId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        flexibleSpace: Image.asset(
          'assets/pic3.png',
          fit: BoxFit.fill,
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(3),
          child: Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
        ),
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => adminHome()));
            },
            child: const Icon(Icons.arrow_back, color: clWhite)),
        title: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text('Product details',
              style: TextStyle(
                  fontFamily: 'cantata', fontSize: 20, color: clWhite)),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<mainProvider>(builder: (context, value, child) {
          return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Center(
                child: InkWell(
                    onTap: () {
                      showBottomSheet(context);
                    },
                    child: value.filebookimage != null
                        ? Container(
                            width: 150,
                            height: 170,
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(5)),
                            child: Image.file(
                              value.filebookimage!,
                              fit: BoxFit.fill,
                            ))
                        : value.imageUpdate != null
                            ? Container(
                                width: 150,
                                height: 170,
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    border: Border.all(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Image.network(
                                  value.imageUpdate!,
                                  fit: BoxFit.fill,
                                ))
                            : Container(
                                width: 150,
                                height: 170,
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    border: Border.all(color: Colors.black12),
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Icon(Icons.add_a_photo_outlined,
                                    color: Colors.black54, size: 70),
                              )),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 210),
                child: Text(
                  'Book name:',
                  style: TextStyle(
                      color:clBlack, fontFamily: 'cantata', fontSize: 16),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: TextField(
                  controller: value.bookNameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 240),
                child: Text(
                  'Author:',
                  style: TextStyle(
                      color: clBlack, fontFamily: 'cantata', fontSize: 16),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: TextField(
                  controller: value.authorController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Autocomplete<categoryadd>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  return value.categorynameslist
                      .where((categoryadd item) => item.categoryname
                          .toLowerCase()
                          .contains(textEditingValue.text.toLowerCase()))
                      .toList();
                },
                displayStringForOption: (categoryadd option) =>
                    option.categoryname,
                fieldViewBuilder: (BuildContext context,
                    TextEditingController fieldTextEditingController,
                    FocusNode fieldFocusNode,
                    VoidCallback onFieldSubmitted) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    fieldTextEditingController.text = value.nameController.text;
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
                              color: clBlack, fontWeight: FontWeight.w200),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: clBlack),
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "Category name",
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
                onSelected: (categoryadd selection) {
                  value.nameController.text = selection.categoryname;
                  value.productSelectedcategoryid = selection.id;
                },
                optionsViewBuilder: (BuildContext context,
                    AutocompleteOnSelected<categoryadd> onSelected,
                    Iterable<categoryadd> options) {
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
                            final categoryadd option = options.elementAt(index);

                            return GestureDetector(
                              onTap: () {
                                onSelected(option);
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                        // border: Border(left: BorderSide(color: Colors.white,width: .6,
                                        // ))
                                        ),
                                    height: 30,
                                    width: 200,
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Center(
                                            child: Text(option.categoryname,
                                                style: const TextStyle(
                                                  fontFamily: 'cantata',
                                                  color: clBlack,
                                                )),
                                          ),
                                        ]),
                                  ),
                                  const Divider(
                                    thickness: 1,
                                    color: clBlack,
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
              ),

              // SizedBox(width: MediaQuery.of(context).size.width/1.1,
              //   child: TextField(
              //
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
              //
              //         )
              //
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 210),
                child: Text(
                  'Description:',
                  style: TextStyle(
                      color: clBlack, fontFamily: 'cantata', fontSize: 16),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 1.1,
                child: TextField(
                  controller: value.descriptionController,
                  maxLines: 4,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 250),
                child: Text(
                  'Price:',
                  style: TextStyle(
                      color: clBlack, fontFamily: 'cantata', fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 140),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextField(
                    controller: value.priceController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  if (frmId == "New") {
                    value.addBook(context, "New", " ");
                  } else {
                    value.addBook(context, "Edit", toId);
                  }

                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => viewProduct()));
                },
                child: Container(
                    width: 150,
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          const BoxShadow(
                              color: cl3E2501, spreadRadius: 10)
                        ],
                        color: cl3E2501),
                    child: frmId == "New"
                        ? const Center(
                            child: Text('Add',
                                style: TextStyle(
                                    fontFamily: 'cantata',
                                    fontSize: 22,
                                    color: clWhite,
                                    fontWeight: FontWeight.bold)))
                        : const Center(
                            child: Text('Update',
                                style: TextStyle(
                                    fontFamily: 'cantata',
                                    fontSize: 22,
                                    color: clWhite,
                                    fontWeight: FontWeight.bold)))),
              ),
              const SizedBox(height: 20),
            ],
          );
        }),
      ),
    );
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
                leading: const Icon(
                  Icons.camera_enhance_sharp,
                  color: Colors.black54,
                ),
                title: const Text(
                  'Camera',
                ),
                onTap: () =>
                    {provider.getImagecamera(), Navigator.pop(context)}),
            ListTile(
                leading: const Icon(Icons.photo, color: clBlack),
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
