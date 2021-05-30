import 'package:flutter/cupertino.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class SignUpController extends ControllerMVC {
  TextEditingController usernameController,
      passwordController,
      userEmailController,
      userContactController;

  @override
  void initState() {
    usernameController = new TextEditingController();
    passwordController = new TextEditingController();
    userEmailController = new TextEditingController();
    userContactController = new TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    userEmailController.dispose();
    userContactController.dispose();
    super.dispose();
  }
}
