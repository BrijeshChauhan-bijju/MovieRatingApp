import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/EditProfileApi/EditProfileApi.dart';
import 'package:imdbmovieapp/data/widget/UniversalClass.dart';
import 'package:imdbmovieapp/utils/memory_management.dart';
import 'package:firebase_storage/firebase_storage.dart';

class EditProfileApiImpl implements EditProfileApi {
  @override
  Future geteditprofileapi(BuildContext context, String key, String keyvalue,
      DatabaseReference _userref, dynamic _imagefile) async {
    Completer<dynamic> completer = new Completer<dynamic>();
    try {
      if (_imagefile != null) {
        Reference firebaseStorageRef = FirebaseStorage.instance
            .ref()
            .child('uploads/${MemoryManagement.getEmail()}');
        var uploadTask =
            await firebaseStorageRef.putFile(_imagefile).then((value) async {
          TaskSnapshot up = value;
          await up.ref.getDownloadURL().then((imageUrl) async {
            await _userref
                .child(MemoryManagement.getLoggedInUserKey().toString())
                .update({"image": imageUrl}).then((value) {
              MemoryManagement.setProfilePic(profilepic: imageUrl);
              showtoast("Image Upload Successfully");
              completer.complete(MemoryManagement.getProfilePic());
              return completer.future;
            });
          });
        });
      } else {
        await _userref
            .child(MemoryManagement.getLoggedInUserKey().toString())
            .update({key: keyvalue}).then((value) {
          if (key.compareTo("username") == 0) {
            MemoryManagement.setUserName(username: keyvalue);
            showtoast("Username Update Successfully");
          } else if (key.compareTo("mobilenumber") == 0) {
            MemoryManagement.setMobileNumber(mobilenumber: keyvalue);
            showtoast("MobileNumber Update successfully");
          }else if (key.compareTo("email") == 0) {
            MemoryManagement.setEmail(email: keyvalue);
            showtoast("Email Update successfully");
          }
          completer.complete(Key);
          return completer.future;
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        completer.complete(e);
        return completer.future;
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        completer.complete(e);
        return completer.future;
      }
    }
  }
}
