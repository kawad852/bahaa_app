import 'package:bahaa_app/utils/app_constants.dart';
import 'package:bahaa_app/utils/base/colors.dart';
import 'package:flutter/material.dart';

class CustomArrowWidget extends StatelessWidget {
  final IconData icon;
  const CustomArrowWidget({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final double _diameter = 40;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      height: _diameter,
      width: _diameter,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppConstants.baseGradient,
      ),
      child: Container(
        alignment: Alignment.center,
        height: _diameter,
        width: _diameter,
        decoration: const BoxDecoration(
          color: MyColors.scaffold,
          shape: BoxShape.circle,
        ),
        child: Icon(icon),
      ),
    );
  }
}
