import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'package:imdbmovieapp/data/webservice/ApiImpl/EditProfileApi/EditProfileApiImpl.dart';
import 'package:imdbmovieapp/data/webservice/repository/EditProfileRepository/EditProfileRepositoryImpl.dart';
import 'package:imdbmovieapp/domain/EditProfileUseCase.dart';

class ProfileScreenProvider with ChangeNotifier {
  EditProfileUseCase _editProfileUseCase =
      EditProfileUseCase(EditProfileRepositoryImpl(EditProfileApiImpl()));

  int _isloading = 0;

  get isloading => _isloading;

  void updatefieldvalue(BuildContext context, String key, String value,
      DatabaseReference _userref, int loadingvalue,
      [_imagefile]) async {
    if (_imagefile != null) {
      setimageloading(true);
    }
    _isloading = loadingvalue;
    var response = await _editProfileUseCase.callapi(
        context, key, value, _userref, _imagefile);
    setfieldeditable(0);
    if (_imagefile != null) {
      setimageloading(false);
    }
    _isloading = 0;
    notifyListeners();
  }

  int _iseditable = 0;

  get iseditable => _iseditable;

  setfieldeditable(int fieldvalue) {
    _iseditable = fieldvalue;
    notifyListeners();
  }

  bool _isimageloading = false;

  get isimageloading => _isimageloading;

  setimageloading(bool imagevalue) {
    _isimageloading = imagevalue;
    notifyListeners();
  }
}
