import 'dart:math';

import 'package:bahaa_app/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReviewBox extends StatelessWidget {
  final String name;
  final String review;
  final String? image;

  const ReviewBox({
    Key? key,
    required this.name,
    required this.review,
    required this.image,
  }) : super(key: key);

  static String _randomImage() {
    Random random = Random();
    int randomNumber = random.nextInt(3);
    var image = "assets/avatars/$randomNumber.svg";
    return image;
  }

  static Color _randomColor() {
    Random random = Random();
    int num = random.nextInt(3);
    if (num == 0) {
      return MyColors.imageBlue;
    } else if (num == 1) {
      return MyColors.imageGreen;
    } else {
      return MyColors.imagePink;
    }
  }

  static Color _getColor(int image) {
    if (image < 4) {
      return MyColors.imageBlue;
    } else if (image < 8) {
      return MyColors.imageGreen;
    } else {
      return MyColors.imagePink;
    }
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
            backgroundColor: image != null ? _getColor(int.parse(image!)) : _randomColor(),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset(
                image != null ? "assets/avatars/$image.svg" : _randomImage(),
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
