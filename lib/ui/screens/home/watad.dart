import 'package:bahaa_app/helper/watad.dart';
import 'package:bahaa_app/ui/widgets/custom_app_bar.dart';
import 'package:bahaa_app/ui/widgets/custom_icon_elevated_button.dart';
import 'package:bahaa_app/utils/base/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class WatadScreen extends StatelessWidget {
  const WatadScreen({Key? key}) : super(key: key);

  static _launchUrl() async {
    Uri uri = Uri.parse("https://watad.me/");
    if (!await launchUrl(uri)) throw 'حدث خطأ ما';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: Text("موقع وتد التعليمي"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            WatadHelper.watad,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 15),
          Text(
            "هدف وتد",
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const Text(
            WatadHelper.watadGoal,
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 20),
          ...WatadHelper.cardData.map((element) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              padding: const EdgeInsets.all(16),
              decoration: WatadHelper.cardDecoration,
              child: Column(children: [
                Text(
                  element["title"].toString(),
                  style: WatadHelper.headline,
                ),
                Text(
                  element["body"].toString(),
                  style: WatadHelper.body,
                ),
              ]),
            );
          }).toList(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: WatadHelper.circlesData.map((element) {
                return Column(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: element["color"] as Color,
                      child: SvgPicture.asset(element["icon"].toString()),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      element["number"].toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      element["title"].toString(),
                      style: WatadHelper.circleTextStyle,
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: CustomIconElevatedButton(
              onTap: () {
                _launchUrl();
              },
              title: "تصفح موقع وتد",
              icon: MyIcons.link,
            ),
          ),
        ],
      ),
    );
  }
}
