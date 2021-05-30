import 'package:flutter/material.dart';
import 'package:flutter_razorpay/constants/constants.dart';
import 'package:flutter_razorpay/controller/razorpayPaymentController.dart';
import 'package:flutter_razorpay/widgets/widget.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class RazorpayPayment extends StatefulWidget {
  @override
  _RazorpayPaymentState createState() => _RazorpayPaymentState();
}

class _RazorpayPaymentState extends StateMVC<RazorpayPayment> {
  RazorpayPaymentController con;

  _RazorpayPaymentState() : super(RazorpayPaymentController()) {
    con = controller as RazorpayPaymentController;
  }

  @override
  void initState() {
    con.initState();
    con.razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    con.razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerPaymentFailure);
    con.razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
    super.initState();
  }

  void handlerPaymentSuccess() {
    print("Payment Success");
    Toast.show("Payment Success", context);
  }

  void handlerPaymentFailure() {
    print("Payment Failed");
    Toast.show("Payment Failed", context);
  }

  void handlerExternalWallet() {
    print("External Wallet");
    Toast.show("External Wallet", context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: uiTextWidget(
              Constants.paymentName, Colors.black, FontWeight.w200, 20.0),
        ),
        body: Center(
          child: Container(
            height: 300,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                uiTextFieldContainer(
                    Constants.ammountDetail, con.amountEditingController, 1),
                SizedBox(height: 20),
                uiTextFieldContainer(
                    Constants.descriptionDetail, con.decriptionController, 6),
              ],
            ),
          ),
        ),
        bottomNavigationBar: uiElevatedButton(openPaymentScreen,
            Constants.proceed, Colors.white, FontWeight.w500, 20.0)
        // ElevatedButton(
        //   style: ButtonStyle(
        //     minimumSize: MaterialStateProperty.all(Size(double.maxFinite, 70)),
        //     backgroundColor: MaterialStateProperty.all(Colors.blue),
        //   ),
        //   onPressed: () {
        //     con.openCheckout();
        //   },
        //   child: uiTextWidget(
        //       Constants.proceed, Colors.white, FontWeight.w500, 20.0),
        // ),
        );
  }

  openPaymentScreen() {
    con.openCheckout();
  }
}
