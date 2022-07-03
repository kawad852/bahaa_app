import 'package:bahaa_app/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewBox extends StatelessWidget {
  final String name;
  final String review;
  final String image;
  final String color;

  const ReviewBox({
    Key? key,
    required this.name,
    required this.review,
    required this.image,
    required this.color,
  }) : super(key: key);

  static Color? _getColor(String color) {
    switch (color) {
      case "0":
        {
          return MyColors.imageBlue;
        }
      case "1":
        {
          return MyColors.imageGreen;
        }
      case "2":
        {
          return MyColors.imagePink;
        }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 27,
            backgroundColor: _getColor(color),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                "assets/avatars/$image.svg",
                height: 50,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  review,
                )
                // Flexible(
                //   child: FittedBox(
                //     child: Text(
                //       review,
                //       style: const TextStyle(color: MyColors.greyC6C),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
