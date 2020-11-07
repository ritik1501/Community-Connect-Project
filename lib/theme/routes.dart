import 'package:book_donation/views/opening_screen.dart';
import 'package:flutter/material.dart';
import 'package:book_donation/views/login_screen.dart';
import 'package:book_donation/views/register_screen.dart';
import 'package:book_donation/views/home_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String authLogin = '/auth-login';
  static const String authRegister = '/auth-register';
  static const String homeScreen = '/home-screen';
  static const String openingScreen = '/opening-screen';

  static Map<String, WidgetBuilder> define(){
    return{
    authLogin: (context) => Login(),
    authRegister: (context) => Register(),
    homeScreen: (context) => Home(),
    openingScreen: (context) => OpeningView(),
  };
}
}
