import 'package:bahaa_app/utils/base/colors.dart';
import 'package:bahaa_app/utils/base/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ReviewBox extends StatelessWidget {
  final String name;
  final String review;
  final String image;
  final int rate;

  const ReviewBox({
    Key? key,
    required this.name,
    required this.review,
    required this.image,
    required this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(width: 20),
        CircleAvatar(
          radius: 27,
          backgroundImage: NetworkImage(
            image,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                children: [
                  for (int i = 0; i < rate; i++) SvgPicture.asset(MyIcons.starFull),
                ],
              ),
            ),
            SizedBox(
              //TODO: make responsive
              width: Get.width - 150,
              child: Text(
                review,
                style: const TextStyle(color: MyColors.greyC6C),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
