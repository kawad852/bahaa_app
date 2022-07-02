import 'dart:math';

import 'package:bahaa_app/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomStudentGradeBox extends StatelessWidget {
  final String name;
  final String grade;
  final String image;

  const CustomStudentGradeBox({
    Key? key,
    required this.name,
    required this.grade,
    required this.image,
  }) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColors.paige3DA,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: MyColors.paige272),
      ),
      child: Column(
        children: [
          const Spacer(),
          CircleAvatar(
            backgroundColor: _randomColor(),
            child: SvgPicture.asset("assets/avatars/$image.svg"),
          ),
          const Spacer(),
          Text(
            name,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: MyColors.grey989,
                  fontWeight: FontWeight.w400,
                ),
          ),
          Text(
            grade,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
