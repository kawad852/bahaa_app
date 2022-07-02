import 'package:url_launcher/url_launcher.dart';

class MapController {
  static Future<void> openMap(
    double latitude,
    double longitude,
  ) async {
    String url = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
  }
}
