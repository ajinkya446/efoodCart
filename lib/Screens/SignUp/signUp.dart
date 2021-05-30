import 'package:flutter/material.dart';
import 'package:flutter_razorpay/Routes/routes.dart';
import 'package:flutter_razorpay/constants/constants.dart';
import 'package:flutter_razorpay/controller/signupController.dart';
import 'package:flutter_razorpay/helper/helper.dart';
import 'package:flutter_razorpay/widgets/widget.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends StateMVC<SignUp> {
  SignUpController signupController;
  _SignUpState() : super(SignUpController()) {
    signupController = controller as SignUpController;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xff739DBC),
            title: uiTextWidget(
                Constants.signupAppbar, Colors.white, FontWeight.w200, 20.0)),
        body: WillPopScope(
            onWillPop: () {
              return Helper.onWillPop(context);
            },
            child: SafeArea(
              child: Center(
                child: Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    color: Colors.transparent,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          uiTextFieldContainer(Constants.userName,
                              signupController.usernameController, 1),
                          uiTextFieldContainer(Constants.userEmail,
                              signupController.userEmailController, 1),
                          uiTextFieldContainer(Constants.password,
                              signupController.passwordController, 1),
                          uiTextFieldContainer(Constants.userContact,
                              signupController.userContactController, 1),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Flex(
                              children: [
                                uiTextWidget(Constants.already_have_account,
                                    Colors.black, FontWeight.w300, 16.0),
                                SizedBox(width: 10),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushReplacementNamed(
                                        context, RouteDeatil.login);
                                  },
                                  child: uiTextWidget(Constants.login,
                                      Colors.blue, FontWeight.bold, 20.0),
                                )
                              ],
                              direction: Axis.horizontal,
                            ),
                          )
                        ])),
              ),
            )),
        bottomNavigationBar: uiElevatedButton(
            submitData, Constants.signUp, Colors.white, FontWeight.bold, 20.0));
  }

  submitData() {
    print("Sign Up");
  }
}
