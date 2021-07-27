import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:imdbmovieapp/presentation/BottomBarScreen/BottomNavigationbarScreen.dart';
import 'package:imdbmovieapp/presentation/LoginScreen/Loginscreenprovider.dart';
import 'package:imdbmovieapp/presentation/RegisterScreen/RegisterScreen.dart';
import 'package:imdbmovieapp/utils/AppColors.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  var _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<LoginScreenProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
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
                    provider.uservalidation(value);

                    return provider.usernamemessage;
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
                    provider.passwordvalidation(value);

                    return provider.passwordmessage;
                  },
                ),
              ),
              SizedBox(
                height: 5,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          BottomNavigationbarScreen()),
                    );
                  }
                },
                child: Text(
                  'Sign In',
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
                            text: "New to Imdbmovie? ",
                            style: TextStyle(color: Colors.grey,fontSize: 16)),
                        TextSpan(
                          text: "Sign up now",
                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()),
                              );
                            },
                        )
                      ])),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
