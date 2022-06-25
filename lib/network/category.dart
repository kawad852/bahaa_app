import 'dart:convert';
import 'dart:developer';

import 'package:bahaa_app/model/category.dart';
import 'package:bahaa_app/utils/api_url.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class CategoryApi {
  static const url = '${ApiUrl.mainUrl}${ApiUrl.category}';
  static final Uri _uri = Uri.parse(url);
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  static Future data() async {
    try {
      log("\nResponse:: CategoryResponse\nUrl:: $url\nheaders:: ${headers.toString()}");
      http.Response response = await http.get(_uri, headers: headers);
      log("\nCategoryStatusCode:: ${response.statusCode}\nCategoryBody:: ${response.body}");
      if (response.statusCode == 200) {
        CategoryModel model = CategoryModel.fromJson(json.decode(response.body));
        return model;
      } else {
        throw Exception("Failed to load data!");
      }
    } on Exception catch (e) {
      log("exception:: $e");
      Fluttertoast.showToast(msg: "حدث خطأ ما");
      return null;
    }
  }
}
