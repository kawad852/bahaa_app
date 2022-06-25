import 'package:bahaa_app/ui/widgets/custom_icon_elevated_button.dart';
import 'package:bahaa_app/utils/app_constants.dart';
import 'package:bahaa_app/utils/base/colors.dart';
import 'package:bahaa_app/utils/base/icons.dart';
import 'package:bahaa_app/utils/base/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class BaseDrawer extends StatelessWidget {
  const BaseDrawer({Key? key}) : super(key: key);

  static const _info = [
    {
      "title": "تواصل معنا",
      "icon": MyIcons.phone,
    },
    {
      "title": "الشروط والأحكام",
      "icon": MyIcons.security,
    },
  ];

  static void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) throw 'حدث خطأ ما';
  }

  static const _social = [
    {
      "icon": MyImages.facebook,
      "url": AppConstants.facebookUrl,
    },
    {
      "icon": MyImages.instagram,
      "url": AppConstants.instagramUrl,
    },
    {
      "icon": MyImages.whatsapp,
      "url": AppConstants.whatsAppUrl,
    },
    {
      "icon": MyImages.youtube,
      "url": AppConstants.youtubeUrl,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: MyColors.scaffold,
      child: Column(
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: MyColors.scaffold,
            ),
            child: Column(
              children: [
                Flexible(
                  child: Image.asset(
                    MyImages.logo,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'الرائع في الكيمياء',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                      ..shader = const LinearGradient(
                        colors: <Color>[
                          MyColors.blueAFF,
                          MyColors.purple4FF,
                        ],
                      ).createShader(
                        const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
                      ),
                  ),
                )
              ],
            ),
          ),
          ..._info.map((element) {
            return ListTile(
              onTap: () {},
              leading: SvgPicture.asset(element['icon'].toString()),
              title: Text(element['title'].toString()),
            );
          }).toList(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _social.map((element) {
                final index = _social.indexOf(element);
                return GestureDetector(
                  onTap: () {
                    switch (index) {
                      case 0:
                        {
                          _launchUrl(element["url"].toString());
                        }
                        break;
                      case 1:
                        {
                          _launchUrl(element["url"].toString());
                        }
                        break;
                      case 2:
                        {
                          _launchUrl(element["url"].toString());
                        }
                        break;
                      case 3:
                        {
                          _launchUrl(element["url"].toString());
                        }
                        break;
                    }
                  },
                  child: Image.asset(
                    element["icon"].toString(),
                  ),
                );
              }).toList(),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: CustomIconElevatedButton(
              onTap: () {},
              title: "تسجل الخروج",
              icon: MyIcons.logout,
            ),
          ),
        ],
      ),
    );
  }
}
