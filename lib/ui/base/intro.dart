import 'package:bahaa_app/ui/base/nav_bar.dart';
import 'package:bahaa_app/utils/app_constants.dart';
import 'package:bahaa_app/utils/base/images.dart';
import 'package:bahaa_app/utils/shared_prefrences.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(BaseImages.intro),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                AppConstants.introText,
                textAlign: TextAlign.center,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Get.offAll(
                    () => const BaseNavBar(),
                    duration: const Duration(milliseconds: 300),
                    transition: Transition.leftToRight,
                  );
                  MySharedPreferences.isPassedIntro = true;
                },
                child: Image.asset(
                  BaseImages.introButton,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
