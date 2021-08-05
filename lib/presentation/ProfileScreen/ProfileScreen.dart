import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:imdbmovieapp/data/widget/UniversalClass.dart';
import 'package:imdbmovieapp/presentation/ProfileScreen/ProfileScreenProvider.dart';
import 'package:imdbmovieapp/utils/AppColors.dart';
import 'package:imdbmovieapp/utils/SharedValues.dart';
import 'package:imdbmovieapp/utils/memory_management.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {
  final ImagePicker _picker = ImagePicker();
  double _maxWidth = 500;
  double _maxHeight = 500;
  late ProfileScreenProvider _profileScreenProvider;
  final DatabaseReference _userRef =
      FirebaseDatabase.instance.reference().child('Users');

  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _mobilenumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _profileScreenProvider = Provider.of<ProfileScreenProvider>(context);
    setvalue();
    final emailBox = Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        shape: BoxShape.rectangle,
        color: Colors.grey.shade800,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Flexible(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextFormField(
                controller: _emailController,
                readOnly: true,
                cursorColor: AppColors.primaryColor,
                onFieldSubmitted: (value) {
                  _profileScreenProvider.updatefieldvalue(context, "email",
                      _emailController.value.text, _userRef, 0);
                },
                decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    hintText: 'Enter Email',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.only(left: 20, right: 20)),
                validator: (value) {
                  // _registerScreenProvider.emailvalidation(value);
                  //
                  // return _registerScreenProvider.email;
                },
              ),
            ),
          ),
        ],
      ),
    );
    final nameBox = Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        shape: BoxShape.rectangle,
        color: Colors.grey.shade800,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Flexible(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextFormField(
                controller: _usernameController,
                readOnly: _profileScreenProvider.iseditable == 1 ? false : true,
                cursorColor: AppColors.primaryColor,
                decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    hintText: 'Enter UserName',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.only(left: 20, right: 20)),
                onFieldSubmitted: (value) {
                  _profileScreenProvider.updatefieldvalue(context, "username",
                      _usernameController.value.text, _userRef, 1);
                },
                // controller: nameController,
                validator: (value) {
                  // _registerScreenProvider.emailvalidation(value);
                  //
                  // return _registerScreenProvider.email;
                },
              ),
            ),
          ),
          _profileScreenProvider.isloading == 1
              ? Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 25, 10),
                    child: SpinKitFadingCircle(
                      color: Colors.black,
                      size: 20.0,
                    ),
                  ),
                )
              : Align(
                  alignment: Alignment.centerRight,
                  child: new InkWell(
                    onTap: () {
                      _profileScreenProvider.setfieldeditable(1);
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 15, 25, 15),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
    final mobilenumberBox = Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        shape: BoxShape.rectangle,
        color: Colors.grey.shade800,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Flexible(
            child: Align(
              alignment: Alignment.centerLeft,
              child: TextFormField(
                readOnly: _profileScreenProvider.iseditable == 3 ? false : true,
                controller: _mobilenumberController,
                cursorColor: AppColors.primaryColor,
                decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    hintText: 'Enter MobileNumber',
                    hintStyle: TextStyle(color: Colors.grey),
                    contentPadding: EdgeInsets.only(left: 20, right: 20)),
                onFieldSubmitted: (value) {
                  _profileScreenProvider.updatefieldvalue(
                      context,
                      "mobilenumber",
                      _mobilenumberController.value.text,
                      _userRef,
                      3);
                },
                // controller: nameController,
                validator: (value) {
                  // _registerScreenProvider.emailvalidation(value);
                  //
                  // return _registerScreenProvider.email;
                },
              ),
            ),
          ),
          _profileScreenProvider.isloading == 3
              ? Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 25, 10),
                    child: SpinKitFadingCircle(
                      color: Colors.black,
                      size: 20.0,
                    ),
                  ),
                )
              : Align(
                  alignment: Alignment.centerRight,
                  child: new InkWell(
                    onTap: () {
                      _profileScreenProvider.setfieldeditable(3);
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 15, 25, 15),
                      child: Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              // key: _formkey,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Text(
                      "Edit Profile",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  circularImage(),
                  SizedBox(
                    height: 20,
                  ),
                  nameBox,
                  SizedBox(
                    height: 20,
                  ),
                  emailBox,
                  SizedBox(
                    height: 20,
                  ),
                  mobilenumberBox,
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  setvalue() {
    _emailController.text = MemoryManagement.getEmail().toString();
    _mobilenumberController.text =
        MemoryManagement.getMobileNumber().toString();
    _usernameController.text = MemoryManagement.getUserName().toString();
  }

  Widget circularImage() {
    return new Stack(alignment: Alignment.bottomRight, children: <Widget>[
      new InkWell(
        onTap: () {
          showMediaOptions(context);
        },
        child: new Container(
          width: 115.0,
          height: 115.0,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
              shape: BoxShape.circle),
          child: _profileScreenProvider.isimageloading
              ? Center(
                  child: SpinKitFadingCircle(
                    color: Colors.white,
                    size: 20.0,
                  ),
                )
              : ClipOval(
                  child: MemoryManagement.getProfilePic()!.isEmpty
                      ? getCachedNetworkImage(
                          fit: BoxFit.fill, url: SharedValues.USERPLACEHOLER)
                      : getCachedNetworkImage(
                          fit: BoxFit.fill,
                          url: MemoryManagement.getProfilePic()),
                ),
        ),
      ),
      new InkWell(
        onTap: () {
          showMediaOptions(context);
        },
        child: Container(
            width: 33.0,
            height: 33.0,
            margin: EdgeInsets.only(right: 10, bottom: 5),
            child: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            decoration:
                new BoxDecoration(shape: BoxShape.circle, color: Colors.black)),
      ),
    ]);
  }

  void showMediaOptions(BuildContext context) async {
    var result = await PhotoManager.requestPermission();
    if (result) {
      showGeneralDialog(
        barrierLabel: "Label",
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: Duration(milliseconds: 700),
        context: context,
        pageBuilder: (contexts, anim1, anim2) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              type: MaterialType.transparency,
              child: Container(
                height: 230,
                margin: EdgeInsets.only(bottom: 20, left: 12, right: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    SizedBox(
                      height: 40,
                    ),
                    new InkWell(
                      onTap: () {
                        _closeActionSheet(context);
                        _onImageButtonPressed(ImageSource.camera, context);
                      },
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20.0,
                          ),
                          Icon(
                            Icons.camera,
                            color: Colors.black,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            'Take Photo',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    new InkWell(
                      onTap: () async {
                        _closeActionSheet(context);
                        _onImageButtonPressed(ImageSource.gallery, context);
                      },
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 20.0,
                          ),
                          Icon(
                            Icons.image,
                            color: Colors.black,
                            size: 30,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "Pick From Gallery",
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    new InkWell(
                        onTap: () {
                          _closeActionSheet(context);
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 15, 20),
                          width: double.infinity,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(27.7)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 2,
                                offset: Offset(
                                    2.0, 2.0), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Center(
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.7,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ),
          );
        },
        transitionBuilder: (context, anim1, anim2, child) {
          return SlideTransition(
            position:
                Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
            child: child,
          );
        },
      );
    } else {
      PhotoManager.openSetting();
    }
  }

  void _closeActionSheet(BuildContext contexts) {
    Navigator.of(context, rootNavigator: true).pop();
  }

  void _onImageButtonPressed(ImageSource source, BuildContext context) async {
    XFile? pickedFile = await _picker.pickImage(
      source: source,
      maxWidth: _maxWidth,
      maxHeight: _maxHeight,
      imageQuality: 100,
    );
    if (pickedFile != null) {
      final File file = File(pickedFile.path);
      _profileScreenProvider.updatefieldvalue(
          context, "image", '', _userRef, 0, file);
    }
  }
}
