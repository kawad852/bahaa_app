import 'package:bahaa_app/ui/base/nav_bar.dart';
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
      "title": "الرئيسية",
      //TODO: fix color
      "icon": MyIcons.home,
    },
    {
      "title": "الطلاب الأوائل",
      "icon": MyIcons.feedback,
    },
    {
      "title": "آراء الطلاب",
      "icon": MyIcons.feedback,
    },
    {
      "title": "بطاقة موقع وتد",
      "icon": MyIcons.card,
    },
    {
      "title": "الأمتحانات المحوسبة",
      "icon": MyIcons.exam,
    },
    {
      "title": "تواصل معنا",
      "icon": MyIcons.phone,
    },
    {
      "title": "الشروط والأحكام",
      "icon": MyIcons.security,
    },
  ];

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

  static void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) throw 'حدث خطأ ما';
  }

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
            final index = _info.indexOf(element);
            return ListTile(
              onTap: () {
                switch (index) {
                  case 0:
                    {
                      navBarController.index = 0;
                    }
                    break;
                  case 1:
                    {
                      navBarController.index = 1;
                    }
                    break;
                  case 2:
                    {
                      navBarController.index = 2;
                    }
                    break;
                  case 3:
                    {
                      navBarController.index = 3;
                    }
                    break;
                  case 4:
                    {
                      navBarController.index = 4;
                    }
                    break;
                }
              },
              leading: SvgPicture.asset(
                element['icon'].toString(),
                color: MyColors.text,
              ),
              title: Text(element['title'].toString()),
            );
          }).toList(),
          const Spacer(),
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
        ],
      ),
    );
  }
}
