import 'package:bahaa_app/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DisplayImageScreen extends StatelessWidget {
  final String image;

  const DisplayImageScreen({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: Text(""),
      ),
      body: Center(
        child: Hero(
          tag: "885",
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset(
              image,
            ),
          ),
        ),
      ),
    );
  }
}
