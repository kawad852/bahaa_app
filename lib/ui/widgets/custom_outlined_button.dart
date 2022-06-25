import 'package:bahaa_app/utils/base/colors.dart';
import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String title;
  final Function() onTap;

  const CustomOutlinedButton({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(3),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50.0),
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.bottomRight,
          colors: [
            BaseColors.blue3FA,
            BaseColors.paigeFDC,
          ],
        ),
      ),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: BaseColors.scaffold,
        ),
        child: Material(
          borderRadius: BorderRadius.circular(50.0),
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(50.0),
            onTap: onTap,
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
