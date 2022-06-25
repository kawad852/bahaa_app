import 'package:bahaa_app/utils/base/colors.dart';
import 'package:flutter/material.dart';

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
            backgroundImage: NetworkImage(image),
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
