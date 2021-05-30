import 'package:flutter/cupertino.dart';
import 'package:toast/toast.dart';

class Helper {
  static DateTime currentBackPressTime;
  static Future<bool> onWillPop(BuildContext context) {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Toast.show("Press Again to close app", context);
      return Future.value(false);
    }
    return Future.value(true);
  }
}
