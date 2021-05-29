import 'package:flutter/material.dart';
import 'package:flutter_razorpay/constants/constants.dart';
import 'package:flutter_razorpay/controller/razorpayPaymentController.dart';
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
      appBar: AppBar(title: Text("Razorpay Payment Gateway ")),
      body: Center(
        child: Container(
          height: 300,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextField(
                    controller: con.amountEditingController,
                    decoration:
                        InputDecoration(hintText: Constants.ammountDetail),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextField(
                    maxLines: 6,
                    controller: con.decriptionController,
                    decoration:
                        InputDecoration(hintText: Constants.descriptionDetail),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height * 0.1,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            onPressed: () {
              con.openCheckout();
            },
            child: Text(
              Constants.proceed,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal),
            )),
      ),
    );
  }
}
