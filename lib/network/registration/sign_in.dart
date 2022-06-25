import 'dart:convert';
import 'dart:developer';

import 'package:bahaa_app/model/registration/sign_in.dart';
import 'package:bahaa_app/utils/api_url.dart';
import 'package:bahaa_app/utils/shared_prefrences.dart';
import 'package:http/http.dart' as http;

class SignInApi {
  static const url = '${ApiUrl.mainUrl}${ApiUrl.signIn}';
  static final Uri _uri = Uri.parse(url);
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  static Future<SignInModel?> signIn({
    required String email,
    required String password,
  }) async {
    try {
      var body = jsonEncode({
        "email": email,
        "password": password,
        "token": MySharedPreferences.deviceToken,
        "image": "",
      });
      log("\nResponse:: SignInResponse\nUrl:: $url\nheaders:: ${headers.toString()}");
      http.Response response = await http.post(_uri, body: body, headers: headers);
      log("\nSignInStatusCode:: ${response.statusCode}\nSignInBody:: ${response.body}");
      if (response.statusCode == 200) {
        SignInModel model = SignInModel.fromJson(json.decode(response.body));
        return model;
      } else {
        throw Exception("Failed to load data!");
      }
    } on Exception catch (e) {
      log("Exception:: $e");
      return null;
    }
  }
}
