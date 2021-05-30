import 'package:flutter/material.dart';
import 'package:flutter_razorpay/Screens/Login/login.dart';
import 'package:flutter_razorpay/Screens/SignUp/signUp.dart';

class RouteDeatil {
  static String signUp = "/signUp";
  static String login = "/login";

  ///Initializes the routes used in the application.
  static Map<String, WidgetBuilder> initializeRoutes() {
    return {
      RouteDeatil.signUp: (context) => SignUp(),
      RouteDeatil.login: (context) => Login(),
    };
  }
}
