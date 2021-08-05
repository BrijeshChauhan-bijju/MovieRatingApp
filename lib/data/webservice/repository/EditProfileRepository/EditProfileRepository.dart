import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

abstract class EditProfileRepository {
  Future<dynamic> geteditprofilerepository(
      BuildContext context,String key,String value,DatabaseReference _userref,dynamic _imagefile);
}
