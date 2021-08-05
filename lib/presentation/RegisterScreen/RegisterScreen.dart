import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:imdbmovieapp/data/model/user_details.dart';
import 'package:imdbmovieapp/presentation/BottomBarScreen/BottomNavigationbarScreen.dart';
import 'package:imdbmovieapp/presentation/LoginScreen/loginScreen.dart';
import 'package:imdbmovieapp/presentation/RegisterScreen/RegisterScreenProvider.dart';
import 'package:imdbmovieapp/utils/AppColors.dart';
import 'package:imdbmovieapp/utils/memory_management.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatefulWidget {
  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  var _formkey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  final DatabaseReference _userRef =
      FirebaseDatabase.instance.reference().child('Users');
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  late RegisterScreenProvider _registerScreenProvider;

  @override
  Widget build(BuildContext context) {
    _registerScreenProvider = Provider.of<RegisterScreenProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage(
                      'assets/images/imdb.png',
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'IMDB MOVIE',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle),
                    child: TextFormField(
                      controller: _emailController,
                      cursorColor: AppColors.primaryColor,
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: 'Enter Email',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.only(left: 20, right: 20)),
                      // controller: nameController,
                      validator: (value) {
                        _registerScreenProvider.emailvalidation(value);

                        return _registerScreenProvider.email;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(50, 2, 50, 0),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle),
                    child: TextFormField(
                      controller: _mobileController,
                      cursorColor: AppColors.primaryColor,
                      keyboardType: TextInputType.number,
                      maxLength: 10,
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: 'Enter Mobile number',
                          counterText: "",
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.only(left: 20, right: 20)),
                      // controller: nameController,
                      validator: (value) {
                        _registerScreenProvider.mobilenumbervalidation(value);

                        return _registerScreenProvider.mobilenumber;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(50, 2, 50, 0),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle),
                    child: TextFormField(
                      controller: _usernameController,
                      cursorColor: AppColors.primaryColor,
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: 'Enter Username',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.only(left: 20, right: 20)),
                      // controller: nameController,
                      validator: (value) {
                        _registerScreenProvider.uservalidation(value);

                        return _registerScreenProvider.usernamemessage;
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(50, 2, 50, 0),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(5),
                        shape: BoxShape.rectangle),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      cursorColor: AppColors.primaryColor,
                      decoration: InputDecoration(
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          border: InputBorder.none,
                          hintText: 'Enter Password',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 0)),
                      validator: (value) {
                        _registerScreenProvider.passwordvalidation(value);

                        return _registerScreenProvider.passwordmessage;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        registeruser(_emailController.value.text,
                            _passwordController.value.text);
                      }
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        side: BorderSide(width: 1, color: Colors.grey),
                        padding: EdgeInsets.fromLTRB(120, 20, 120, 20)),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: EdgeInsets.only(right: 50),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Already have an account? ",
                            style: TextStyle(color: Colors.grey, fontSize: 16)),
                        TextSpan(
                          text: "Sign in now",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                  (Route<dynamic> route) => false);
                            },
                        )
                      ])),
                    ),
                  )
                ],
              ),
            ),
          ),
          Visibility(
              visible: _registerScreenProvider.isloading,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              ))
        ],
      ),
    );
  }

  void registeruser(String email, String password) async {
    UserDetails userDetails = UserDetails();
    userDetails.email = email;
    userDetails.password = password;
    userDetails.mobilenumber = _mobileController.text;
    userDetails.username = _usernameController.text;
    userDetails.image = ' ';

    saveMessage(userDetails);
  }

  void saveMessage(UserDetails userDetails) async {
    _registerScreenProvider.registeruser(userDetails, _userRef, context);
  }
}
