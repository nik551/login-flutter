
import 'package:flutter/material.dart';
import 'package:simple_learn/login.dart';
import 'package:simple_learn/signup.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  //first show login pge
  bool showLoginPage = true;
  void toggleScreens(){
    setState(() {
      showLoginPage =!showLoginPage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLoginPage){
      return LogInPage(showRegisterPage: toggleScreens);
    }else{
      return RegisterPage(showLoginPage:toggleScreens);
    }
  }
}
