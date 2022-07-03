import 'package:bahaa_app/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomStudentGradeBox extends StatelessWidget {
  final String name;
  final String grade;
  final String image;
  final String color;

  const CustomStudentGradeBox({
    Key? key,
    required this.name,
    required this.grade,
    required this.image,
    required this.color,
  }) : super(key: key);

  static Color _getColor(String num) {
    if (num == "0") {
      return MyColors.imageBlue;
    } else if (num == "1") {
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
            backgroundColor: _getColor(color),
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
