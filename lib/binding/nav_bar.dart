import 'package:bahaa_app/controller/registration/sign_in.dart';
import 'package:get/get.dart';

class NavBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
  }
}
