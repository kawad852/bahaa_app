import 'package:bahaa_app/translation/arabic.dart';
import 'package:bahaa_app/translation/english.dart';
import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": en,
        "ar": ar,
      };
}
