import 'package:flutter/material.dart';

class LoginScreenProvider extends ChangeNotifier {
  var _usernamemessage;

  get usernamemessage => _usernamemessage;

  void uservalidation(String? user) {
    if (user!.length>0) {
      _usernamemessage = null;
      notifyListeners();
    }else{
      _usernamemessage = "Please enter Username";
      notifyListeners();
    }
  }
  var _passwordmessage;
  get passwordmessage => _passwordmessage;

  void passwordvalidation(String ?pass) {
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
