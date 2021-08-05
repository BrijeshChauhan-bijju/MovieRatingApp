import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:imdbmovieapp/data/webservice/ApiImpl/EditProfileApi/EditProfileApi.dart';
import 'package:imdbmovieapp/data/webservice/repository/EditProfileRepository/EditProfileRepository.dart';

class EditProfileRepositoryImpl implements EditProfileRepository {
  late EditProfileApi _editProfileApi;

  EditProfileRepositoryImpl(EditProfileApi _editProfileApi) {
    this._editProfileApi = _editProfileApi;
  }

  @override
  Future geteditprofilerepository(BuildContext context, String key,
      String value, DatabaseReference _userref, dynamic _imagefile) {
    return _editProfileApi.geteditprofileapi(context, key, value, _userref, _imagefile);
  }
}
