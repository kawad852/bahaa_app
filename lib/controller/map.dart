import 'dart:developer';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

class MapController {
  static Future<void> openMap(
    double latitude,
    double longitude,
  ) async {
    try {
      String url = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
      await launchUrl(Uri.parse(url));
    } catch (e) {
      log("error:: $e");
      Fluttertoast.showToast(msg: "الموقع غير متوفر حاليا");
    }
  }
}
