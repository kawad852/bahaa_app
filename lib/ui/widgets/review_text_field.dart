import 'package:bahaa_app/utils/app_constants.dart';
import 'package:bahaa_app/utils/base/colors.dart';
import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final int maxLines;
  final double height;
  final String hintText;
  final Widget? icon;
  final TextEditingController controller;
  final TextInputType? keyboardType;

  const CustomField({
    Key? key,
    this.maxLines = 1,
    required this.height,
    required this.hintText,
    this.icon,
    required this.controller,
    this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: AppConstants.baseGradient,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(5, 5, icon == null ? 5 : 10, 5),
          child: TextField(
            keyboardType: keyboardType,
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              icon: icon,
              filled: true,
              fillColor: MyColors.scaffold,
              constraints: const BoxConstraints(maxHeight: 200),
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
