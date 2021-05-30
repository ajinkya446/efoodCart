import 'package:flutter/material.dart';
import 'package:flutter_razorpay/Routes/routes.dart';
import 'package:flutter_razorpay/constants/constants.dart';
import 'package:flutter_razorpay/controller/loginController.dart';
import 'package:flutter_razorpay/helper/helper.dart';
import 'package:flutter_razorpay/widgets/widget.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends StateMVC<Login> {
  LoginController loginController;
  _LoginState() : super(LoginController()) {
    loginController = controller as LoginController;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xff739DBC),
          title: uiTextWidget(
              Constants.loginAppbar, Colors.white, FontWeight.w200, 20.0)),
      body: WillPopScope(
        onWillPop: () {
          return Helper.onWillPop(context);
        },
        child: SafeArea(
          child: Center(
            child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                color: Colors.transparent,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      uiTextFieldContainer(Constants.userName,
                          loginController.usernameController, 1),
                      uiTextFieldContainer(Constants.password,
                          loginController.passwordController, 1),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Flex(
                          children: [
                            uiTextWidget(Constants.dont_have_account,
                                Colors.black, FontWeight.w300, 16.0),
                            SizedBox(width: 10),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, RouteDeatil.signUp);
                              },
                              child: uiTextWidget(Constants.signUp, Colors.blue,
                                  FontWeight.bold, 20.0),
                            ),
                          ],
                          direction: Axis.horizontal,
                        ),
                      )
                    ])),
          ),
        ),
      ),
      bottomNavigationBar: uiElevatedButton(
          submitData, Constants.login, Colors.white, FontWeight.bold, 20.0),
    );
  }

  submitData() {
    print("Login");
  }
}
