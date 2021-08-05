import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:imdbmovieapp/data/model/user_details.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/RegisterUserApi/RegisterUserApi.dart';
import 'package:imdbmovieapp/utils/memory_management.dart';

class RegisterUserApiImpl implements RegisterUserApi {
  @override
  Future getregisteruserapi(
      UserDetails userDetails, DatabaseReference _userRef) async {
    Completer<dynamic> completer = new Completer<dynamic>();
    await _userRef.push().set(userDetails.toJson());

    _userRef
        .orderByChild("email")
        .equalTo(userDetails.email)
        .once()
        .then((DataSnapshot dataSnapshot) {
      // String newKey = dataSnapshot.value.keys;
      Map<dynamic, dynamic> mapvalue = dataSnapshot.value;
      dataSnapshot.value.forEach((key, values) {
        MemoryManagement.setEmail(email: values["email"]);
        MemoryManagement.setUserName(username: values["username"]);
        MemoryManagement.setMobileNumber(mobilenumber: values["mobilenumber"]);
        MemoryManagement.setLoggedInUserKey(key: mapvalue.keys.single);
        MemoryManagement.setIsUserLoggedIn(isuserloggedin: true);
        MemoryManagement.setProfilePic(profilepic: values["image"]);
      });
    });
  }
}
