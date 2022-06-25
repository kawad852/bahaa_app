import 'package:fluttertoast/fluttertoast.dart';

class MyComponents {
  static void showToast(String msg) {
    Fluttertoast.showToast(msg: msg);
  }

  static void handleError() {
    Fluttertoast.showToast(msg: "حدث خطأ ما");
  }
}
