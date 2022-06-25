import 'package:bahaa_app/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DrawerButton extends StatelessWidget {
  const DrawerButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, top: 20),
      child: Align(
        alignment: Alignment.centerRight,
        child: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(
            FontAwesomeIcons.barsStaggered,
            color: MyColors.text,
          ),
        ),
      ),
    );
  }
}
