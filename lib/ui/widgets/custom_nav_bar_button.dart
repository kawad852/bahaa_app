import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavBaaButton extends StatelessWidget {
  final String icon;
  final String title;
  final Color color;

  const CustomNavBaaButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.color,
  }) : super(key: key);

  static Color _toggleColor(bool isChosen) {
    if (isChosen) {
      return Colors.white.withOpacity(0.19);
    } else {
      return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: SvgPicture.asset(
            icon,
            color: color,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 3.0),
          child: Material(
            type: MaterialType.transparency,
            child: FittedBox(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
