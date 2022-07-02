import 'package:bahaa_app/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class MyErrorDialog {
  static showErrorDialog(BuildContext context) {
    Alert(
      context: context,
      type: AlertType.error,
      title: "تنبيه!",
      desc: "حدث خطأ أثناء ارسال الطلب, الرجاء التواصل مع المسؤول",
      buttons: [
        DialogButton(
          color: MyColors.blue3FA,
          onPressed: () => Navigator.pop(context),
          width: 120,
          child: const Text(
            "حسنا",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        )
      ],
    ).show();
  }
}
