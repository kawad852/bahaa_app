import 'package:bahaa_app/ui/screens/home/top_students.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrowseMoreButton extends StatelessWidget {
  const BrowseMoreButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "الطلاب الأوائل",
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          TextButton(
            onPressed: () {
              Get.to(() => const PeriodicTableScreen());
            },
            child: const Text("تصفح المزيد"),
          ),
        ],
      ),
    );
  }
}
