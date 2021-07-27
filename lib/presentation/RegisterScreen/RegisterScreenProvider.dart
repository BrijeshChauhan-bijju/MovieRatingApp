import 'package:flutter/material.dart';

class RegisterScreenProvider extends ChangeNotifier {
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
     if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(emailstring!)) {
      _email = "Please enter valid email";
      notifyListeners();
    } else {
      _email = null;
      notifyListeners();
    }
  }

  var _usernamemessage;

  get usernamemessage => _usernamemessage;

  void uservalidation(String ?user) {
    if (user!.length > 0) {
      _usernamemessage = null;
      notifyListeners();
    }else{
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
    }else{
      _passwordmessage = null;
      notifyListeners();
    }
  }



  var _isobscuretext=true;
  get isobscuretext => _isobscuretext;

  void changeobscuretext(){
    if(_isobscuretext==false){
      _isobscuretext = true;
      notifyListeners();
    }else{
      _isobscuretext = false;
      notifyListeners();
    }
  }
}
