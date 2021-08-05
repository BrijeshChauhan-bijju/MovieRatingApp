import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/LoginUserApi/LoginUserApi.dart';
import 'package:imdbmovieapp/utils/memory_management.dart';

class LoginUserApiImpl implements LoginUserApi {
  @override
  Future getloginuserapi(
      String email, String password, DatabaseReference _userref) async {
    Completer<dynamic> completer = new Completer<dynamic>();
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      await _userref
          .orderByChild("email")
          .equalTo(email)
          .once()
          .then((DataSnapshot dataSnapshot) {
        Map<dynamic, dynamic> mapvalue = dataSnapshot.value;
        print("keys=>,${mapvalue.keys.single}");
        dataSnapshot.value.forEach((key, values) {
          MemoryManagement.setEmail(email: values["email"]);
          MemoryManagement.setUserName(username: values["username"]);
          MemoryManagement.setMobileNumber(
              mobilenumber: values["mobilenumber"]);
          MemoryManagement.setLoggedInUserKey(key: mapvalue.keys.single);
          MemoryManagement.setIsUserLoggedIn(isuserloggedin: true);
          MemoryManagement.setProfilePic(profilepic: values["image"]);
        });
        completer.complete(dataSnapshot.value);
      });
      return completer.future;
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
