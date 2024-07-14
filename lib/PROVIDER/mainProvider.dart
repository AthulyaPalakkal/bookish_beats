import 'dart:collection';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../MODELCLASS/modelcls.dart';

class mainProvider extends ChangeNotifier {
  Reference imagestorage = FirebaseStorage.instance.ref("Images");
  FirebaseFirestore db = FirebaseFirestore.instance;

  File? filebookimage;
  String image = "";

  File? filereviewimage;
  String reviewimage = "";

  File? filebokotweekimage;
  String bookotweek = "";

  TextEditingController nameController = TextEditingController();

  Future<void> addcategory() async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> addcgmap = HashMap();
    addcgmap['CATEGORY'] = nameController.text;
    addcgmap['CATEGORY ID'] = id;
    db.collection("CATEGORY").doc(id).set(addcgmap);
    getCatgoryData();
  }

  List<categoryadd> categorynameslist = [];
  void getCatgoryData() {
    db.collection("CATEGORY").get().then((value) {
      print("asadgg");
      if (value.docs.isNotEmpty) categorynameslist.clear();
      {
        for (var element in value.docs) {
          categorynameslist
              .add(categoryadd(element.id, element.get("CATEGORY").toString()));
          notifyListeners();
          print(categorynameslist.length.toString());
        }
      }
    });
  }

  void clearcategoryname() {
    nameController.clear();
  }

  void deleteCategory(context, idd) {
    db.collection("CATEGORY").doc(idd).delete();

    getCatgoryData();
    notifyListeners();
  }

  TextEditingController bookNameController = TextEditingController();
  TextEditingController authorController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  void clearproduct() {
    bookNameController.clear();
    authorController.clear();
    descriptionController.clear();
    priceController.clear();
    filebookimage = null;
    imageUpdate = null;
  }

  String dropDownvalue = 'classics';
  void dropDowncategory(String? newValue) {
    dropDownvalue = newValue!;
    notifyListeners();
  }


  String productSelectedcategoryid = "";
  String booknameid ="";
  Future<void> addBook(BuildContext context, String frm, String uid) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> addbookmap = HashMap();
    addbookmap["BOOK_ID"] = id.toString();
    addbookmap["BOOK_NAME"] = bookNameController.text;
    addbookmap["AUTHOR"] = authorController.text;
    addbookmap["CATEGORY_ID"] = productSelectedcategoryid.toString();
    addbookmap["BOOKNAME_ID"] = booknameid.toString();
    addbookmap["CATEGORY_NAME"] = nameController.text;
    addbookmap["DESCRIPTION"] = descriptionController.text;
    addbookmap["PRICE"] = priceController.text;
    if (filebookimage != null) {
      String bookimgid = DateTime.now().millisecondsSinceEpoch.toString();
      imagestorage = FirebaseStorage.instance.ref().child(bookimgid);
      await imagestorage.putFile(filebookimage!).whenComplete(() async {
        await imagestorage.getDownloadURL().then((value) {
          addbookmap["IMAGE"] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    }
    if (frm == "New") {
      db.collection("BOOK_DETAILS").doc(id).set(addbookmap);
    } else {
      db.collection("BOOK_DETAILS").doc(uid).update(addbookmap);
      const snackBar = SnackBar(
        content: Text("Updated"),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    getBookDetails();
  }

  List<productadd> bookList = [];
  void getBookDetails() {
    db.collection("BOOK_DETAILS").get().then((value) {
      if (value.docs.isNotEmpty) {
        bookList.clear();
        notifyListeners();

        for (var element in value.docs) {
          bookList.add(productadd(
              element.id,
              element.get("IMAGE").toString(),
              element.get("BOOK_NAME").toString(),
              element.get("AUTHOR").toString(),
              element.get("CATEGORY_NAME").toString(),
              element.get("DESCRIPTION").toString(),
              element.get("PRICE").toString()));
          notifyListeners();
          print(bookList.length.toString());
        }
      }
      notifyListeners();
    });
  }

  Future getImagecamera() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // print("dfghjk"+pickedImage.path);
      cropImage(pickedImage.path);
      // setImage(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }

  Future getImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropImage(
        pickedImage.path,
      );
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropImage(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9,
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9,
              CropAspectRatioPreset.ratio16x9
            ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      filebookimage = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }

  void deleteProduct(context, idd) {
    db.collection("BOOK_DETAILS").doc(idd).delete();

    getBookDetails();
    notifyListeners();
  }

  String? imageUpdate;
  void editDetails(String id) {
    db.collection("BOOK_DETAILS").doc(id).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> bookdetailsmap = value.data() as Map;
        bookNameController.text = bookdetailsmap["BOOK_NAME"].toString();
        authorController.text = bookdetailsmap["AUTHOR"].toString();
        descriptionController.text = bookdetailsmap["DESCRIPTION"].toString();
        priceController.text = bookdetailsmap["PRICE"].toString();
        imageUpdate = bookdetailsmap["IMAGE"];
        notifyListeners();
      }
    });
  }

  void getcategorydetails(String cName) {
    db.collection("BOOK_DETAILS").where("CATEGORY_NAME", isEqualTo: cName).get().then((value)
    {
      if (value.docs.isNotEmpty) {
        bookList.clear();
        notifyListeners();
        {
          for (var element in value.docs) {
            bookList.add(productadd(
                element.id,
                element.get("IMAGE").toString(),
                element.get("BOOK_NAME").toString(),
                element.get("AUTHOR").toString(),
                element.get("CATEGORY_NAME").toString(),
                element.get("DESCRIPTION").toString(),
                element.get("PRICE").toString()));
            notifyListeners();
          }
        }
      }
      notifyListeners();
    });
  }


  Future<void> addevents() async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> addeventmap = HashMap();
    addeventmap["EVENT_TYPE"] = eventTypeController.text;
    addeventmap["DATE"] = dateController.text;
    addeventmap["TIME"] = timeController.text;
    addeventmap["VENU"] = venuController.text;
    addeventmap["TOPIC"] = topicController.text;
    addeventmap["GUESTS"] = guestController.text;

    db.collection("EVENTS").doc(id).set(addeventmap);
    getEvents();
  }

  TextEditingController eventTypeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController venuController = TextEditingController();
  TextEditingController topicController = TextEditingController();
  TextEditingController guestController = TextEditingController();

  List<eventsadd> eventsList = [];
  void getEvents() {
    db.collection("EVENTS").get().then((value) {
      print("abcd");
      if (value.docs.isNotEmpty) eventsList.clear();
      {
        for (var element in value.docs) {
          eventsList.add(eventsadd(
              element.id,
              element.get("EVENT_TYPE").toString(),
              element.get("DATE").toString(),
              element.get("TIME").toString(),
              element.get("VENU").toString(),
              element.get("TOPIC").toString(),
              element.get("GUESTS").toString()));

          print(eventsList.length.toString());
        }
        notifyListeners();
      }
      notifyListeners();
    });
  }

  void deleteEvents(context, idd) {
    db.collection("EVENTS").doc(idd).delete();

    getEvents();
    notifyListeners();
  }

  TextEditingController userNumberController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  Future<void> userSignup(String userId, String from) async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> userSignupmap = HashMap();
    userSignupmap["PHONE"] = userNumberController.text;
    userSignupmap["NAME"] = userNameController.text;
    userSignupmap["DATE"] = DateTime.now().toString();

    HashMap<String, Object> signupmap = HashMap();
    signupmap["PHONE"] = "+91" + userNumberController.text;
    signupmap["NAME"] = userNameController.text;
    signupmap["TYPE"] = "USER";
    if (fileprofileimage != null) {
      String photoId = DateTime.now().millisecondsSinceEpoch.toString();

      imagestorage = FirebaseStorage.instance.ref().child(photoId);
      await imagestorage.putFile(fileprofileimage!).whenComplete(() async {
        await imagestorage.getDownloadURL().then((value) {
          userSignupmap["PHOTO"] = value;
          // categorymap["id photo"] = photoId;
          //  editMap['IMAGE_URL'] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      userSignupmap['PHOTO'] = profileimage;
      // editMap['IMAGE_URL'] = imageUrl;
    }
    if (from == "NEW") {
      signupmap["USER_ID"] = id;
      userSignupmap["CUSTOMER_ID"] = id;
    }
    if (from == "NEW") {
      db.collection("CUSTOMER_DETAILS").doc(id).set(userSignupmap);
      db.collection("USERS").doc(id).set(signupmap);
    } else {
      db.collection("CUSTOMER_DETAILS").doc(userId).update(userSignupmap);
      db.collection("USERS").doc(userId).update(signupmap);

      notifyListeners();
    }

    getuser(userId);
    notifyListeners();
  }

  // String userid="";
  void getuser(String userId) {
    db.collection("CUSTOMER_DETAILS").doc(userId).get().then((value) {
      if (value.exists) {
        // userid=value.id;
        userNumberController.text = value.get("PHONE").toString();
        userNameController.text = value.get("NAME").toString();
        profileimage = value.get("PHOTO").toString();
        notifyListeners();
      }
    });
  }

  Future<void> addrreview() async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> addreviewmap = HashMap();
    addreviewmap['REVIEW'] = reviewController.text;
    addreviewmap['REVIEW_ID'] = id;
    if (filereviewimage != null) {
      String reviewimageid = DateTime.now().millisecondsSinceEpoch.toString();
      imagestorage = FirebaseStorage.instance.ref().child(reviewimageid);
      await imagestorage.putFile(filereviewimage!).whenComplete(() async {
        await imagestorage.getDownloadURL().then((value) {
          addreviewmap["IMAGE"] = value;
          db.collection("REVIEWS").doc(id).set(addreviewmap);

          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    }
  }

  TextEditingController reviewController = TextEditingController();

  Future getReviewImagecamera() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // print("dfghjk"+pickedImage.path);
      cropReviewImage(pickedImage.path);
      // setImage(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }

  Future getReviewImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropReviewImage(
        pickedImage.path,
      );
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropReviewImage(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9,
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9,
              CropAspectRatioPreset.ratio16x9
            ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      filereviewimage = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }

  void clearReview() {
    reviewController.clear();
    filebookimage = null;
  }

  List<reviewadd> reviewlist = [];

  void getReview() {
    db.collection("REVIEWS").get().then((value) {
      if (value.docs.isNotEmpty) reviewlist.clear();
      {
        for (var element in value.docs) {
          reviewlist.add(reviewadd(element.id, element.get("IMAGE").toString(),
              element.get("REVIEW").toString()));
          notifyListeners();
          print(reviewlist.length.toString());
        }
      }
      notifyListeners();
    });
  }

  TextEditingController bookController = TextEditingController();
  TextEditingController authornameController = TextEditingController();
  TextEditingController descriptionsController = TextEditingController();
  TextEditingController priceeController = TextEditingController();

  Future<void> addbookotweek() async {
    String id = DateTime.now().millisecondsSinceEpoch.toString();
    HashMap<String, Object> addbookotmap = HashMap();
    addbookotmap['BOOKOFTHEWEEK'] = id;
    if (filebokotweekimage != null) {
      String bookotimageid = DateTime.now().millisecondsSinceEpoch.toString();
      imagestorage = FirebaseStorage.instance.ref().child(bookotimageid);
      await imagestorage.putFile(filebokotweekimage!).whenComplete(() async {
        await imagestorage.getDownloadURL().then((value) {
          addbookotmap["IMAGE"] = value;
          db.collection("BOOK_OF_THE_WEEK").doc(id).set(addbookotmap);

          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    }
  }

  void getbookOTWdetails(String bName) {
    db.collection("BOOK_DETAILS").where("BOOK_NAME", isEqualTo: bName).get().then((value)
    {
      if (value.docs.isNotEmpty) {
        bookList.clear();
        notifyListeners();
        {
          for (var element in value.docs) {
            bookList.add(productadd(
                element.id,
                element.get("IMAGE").toString(),
                element.get("BOOK_NAME").toString(),
                element.get("AUTHOR").toString(),
                element.get("CATEGORY_NAME").toString(),
                element.get("DESCRIPTION").toString(),
                element.get("PRICE").toString()));
            notifyListeners();
          }
        }
        notifyListeners();
      }
    });
  }


  double? ratingValue;
  void rtngs(double value) {
    print("rty" + ratingValue.toString());
    ratingValue = value;
  }

  File? fileprofileimage;
  String profileimage = "";

  Future getprofileImagecamera() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      // print("dfghjk"+pickedImage.path);
      cropprofileImage(pickedImage.path);
      // setImage(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }

  Future getprofileImagegallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropprofileImage(
        pickedImage.path,
      );
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropprofileImage(String path) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio16x9,
            ]
          : [
              CropAspectRatioPreset.original,
              CropAspectRatioPreset.square,
              CropAspectRatioPreset.ratio3x2,
              CropAspectRatioPreset.ratio4x3,
              CropAspectRatioPreset.ratio5x3,
              CropAspectRatioPreset.ratio5x4,
              CropAspectRatioPreset.ratio7x5,
              CropAspectRatioPreset.ratio16x9,
              CropAspectRatioPreset.ratio16x9
            ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),

        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      fileprofileimage = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }
}
