import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imdbmovieapp/presentation/BottomBarScreen/BottomNavigationbarScreen.dart';
import 'package:imdbmovieapp/presentation/LoginScreen/Loginscreenprovider.dart';
import 'package:imdbmovieapp/presentation/RegisterScreen/RegisterScreen.dart';
import 'package:imdbmovieapp/utils/AppColors.dart';
import 'package:imdbmovieapp/utils/memory_management.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  var _formkey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final DatabaseReference _userRef =
      FirebaseDatabase.instance.reference().child('Users');

  late LoginScreenProvider _loginscreenProvider;

  @override
  Widget build(BuildContext context) {
    _loginscreenProvider = Provider.of<LoginScreenProvider>(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.black,
          body: Stack(
            children: <Widget>[
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
                              hintText: 'Enter Username',
                              hintStyle: TextStyle(color: Colors.grey),
                              contentPadding:
                                  EdgeInsets.only(left: 20, right: 20)),
                          // controller: nameController,
                          validator: (value) {
                            _loginscreenProvider.uservalidation(value);

                            return _loginscreenProvider.usernamemessage;
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
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 0, 20, 0)),
                          validator: (value) {
                            _loginscreenProvider.passwordvalidation(value);

                            return _loginscreenProvider.passwordmessage;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () {
                          if (_formkey.currentState!.validate()) {
                            loginUser(_emailController.value.text,
                                _passwordController.value.text);
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.fromLTRB(50, 2, 50, 0),
                          decoration: BoxDecoration(
                              color: Colors.black,
                              border: Border.all(color: Colors.grey, width: 1)),
                          child: Text(
                            'Sign In',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
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
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 16)),
                            TextSpan(
                              text: "Sign up now",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
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
              Visibility(
                  visible: _loginscreenProvider.isloading,
                  child: Center(
                    child: CircularProgressIndicator(color: AppColors.primaryColor,),
                  ))
            ],
          ),
        )));
  }

  void loginUser(String email, String password) async {
    _loginscreenProvider.loginuser(email, password, _userRef,context);

    // print("type=>,${_loginscreenProvider.loginuserdetails}");
    // _loginscreenProvider.loginuserdetails.forEach((key, values) {
    //   MemoryManagement.setEmail(email: values["email"]);
    //   MemoryManagement.setUserName(username: values["username"]);
    //   MemoryManagement.setMobileNumber(mobilenumber: values["mobilenumber"]);
    //   MemoryManagement.setLoggedInUserKey(key: _loginscreenProvider.loginuserdetails.keys.toString());
    //   MemoryManagement.setIsUserLoggedIn(isuserloggedin: true);
    // });
  }

}
