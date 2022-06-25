import 'package:bahaa_app/network/registration/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignInController {
  Future fetchSignInData({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    Loader.show(context);
    await SignInApi.signIn(email: email, password: password).then((value) {
      Loader.hide();
      if (value == null) {
        Fluttertoast.showToast(msg: 'Something went wrong');
        return;
      }
      if (value.code == 200) {
        //do my stuff
      } else {
        //do my stuff
      }
    });
  }
}
