import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class LoginController extends ControllerMVC {
  TextEditingController usernameController, passwordController;

  @override
  void initState() {
    usernameController = new TextEditingController();
    passwordController = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
