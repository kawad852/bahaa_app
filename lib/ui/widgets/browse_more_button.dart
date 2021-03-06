import 'package:bahaa_app/ui/base/nav_bar.dart';
import 'package:flutter/material.dart';

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
              navBarController.index = 1;
            },
            child: const Text("تصفح المزيد"),
          ),
        ],
      ),
    );
  }
}
