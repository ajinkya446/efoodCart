import 'package:flutter/material.dart';
import 'package:flutter_razorpay/constants/constants.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayPaymentController extends ControllerMVC {
  Razorpay razorpay;
  TextEditingController amountEditingController, decriptionController;

  @override
  void initState() {
    amountEditingController = new TextEditingController();
    decriptionController = new TextEditingController();
    razorpay = new Razorpay();
    super.initState();
  }

  @override
  void dispose() {
    amountEditingController.dispose();
    decriptionController.dispose();
    razorpay.clear();
    super.dispose();
  }

  void openCheckout() {
    Map<String, dynamic> options = {
      Constants.keyName: Constants.paymentKey,
      Constants.name: Constants.paymentName,
      Constants.paymentDescritpion: decriptionController.text,
      Constants.amount: num.parse(amountEditingController.text) * 100,
      Constants.prefill: {"contact": "4455445545", "email": "asa@gmail.com"},
      Constants.externalDetail: {
        Constants.wallet: ["PayTM"]
      }
    };
    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }
}
