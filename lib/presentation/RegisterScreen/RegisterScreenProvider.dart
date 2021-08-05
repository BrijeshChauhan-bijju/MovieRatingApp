import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:imdbmovieapp/data/model/user_details.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/RegisterUserApi/RegisterUserApiImpl.dart';
import 'package:imdbmovieapp/data/webservice/repository/RegisterUserRepository/RegisterUserRepositoryImpl.dart';
import 'package:imdbmovieapp/domain/RegisterUserUseCase.dart';
import 'package:imdbmovieapp/presentation/BottomBarScreen/BottomNavigationbarScreen.dart';

class RegisterScreenProvider extends ChangeNotifier {
  RegisterUserUseCase _registerUserUseCase =
      RegisterUserUseCase(RegisterUserRepositoryImpl(RegisterUserApiImpl()));

  var _isChecking = false;

  //Getter for checkbox
  get isChecked => _isChecking;

  void isradiochecked(value) {
    _isChecking = value;
    notifyListeners();
  }

  var _mobilenumber;

  get mobilenumber => _mobilenumber;

  void mobilenumbervalidation(String? mobilenumber) {
    if (mobilenumber!.length < 10) {
      _mobilenumber = "Please enter 10 digit MobileNumber";
      notifyListeners();
    } else {
      _mobilenumber = null;
      notifyListeners();
    }
  }

  var _email;

  get email => _email;

  void emailvalidation(String? emailstring) {
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailstring!)) {
      _email = "Please enter valid email";
      notifyListeners();
    } else {
      _email = null;
      notifyListeners();
    }
  }

  var _usernamemessage;

  get usernamemessage => _usernamemessage;

  void uservalidation(String? user) {
    if (user!.length > 0) {
      _usernamemessage = null;
      notifyListeners();
    } else {
      _usernamemessage = "Please enter Username";

      notifyListeners();
    }
  }

  var _passwordmessage;

  get passwordmessage => _passwordmessage;

  void passwordvalidation(String? pass) {
    if (pass!.length < 8) {
      _passwordmessage = "Please enter 8 digit password";
      notifyListeners();
    } else {
      _passwordmessage = null;
      notifyListeners();
    }
  }

  var _isobscuretext = true;

  get isobscuretext => _isobscuretext;

  void changeobscuretext() {
    if (_isobscuretext == false) {
      _isobscuretext = true;
      notifyListeners();
    } else {
      _isobscuretext = false;
      notifyListeners();
    }
  }

  late DataSnapshot _registeruserdetails;

  get registeruserdetails => _registeruserdetails;

  bool _isloading = false;

  get isloading => _isloading;

  void registeruser(UserDetails userDetails, DatabaseReference _userref,
      BuildContext context) async {
    _isloading = true;
    var responses = await _registerUserUseCase.callapi(userDetails, _userref);

    print("responses=>,${responses}");
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => BottomNavigationbarScreen()),
    );

    _isloading = false;
    notifyListeners();
  }
}
