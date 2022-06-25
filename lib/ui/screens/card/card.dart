import 'package:bahaa_app/ui/base/drawer.dart';
import 'package:bahaa_app/ui/widgets/custom_arrow_widget.dart';
import 'package:bahaa_app/utils/app_constants.dart';
import 'package:bahaa_app/utils/base/colors.dart';
import 'package:bahaa_app/utils/base/images.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final _tileTextStyle = const TextStyle(fontSize: 10);

  final _cities = [
    "عمان",
    "إربد",
    "الزرقاء",
    "الرصيفة",
    "السلط",
    "الطفيلة",
    "العقبة",
    "الفحيص",
    "المفرق",
    "جرش",
    "مأدبا",
    "معان",
    "عجلون",
    "الكرك",
    "الكرك",
    "الرمثا",
    "الأغوار",
    "ماحص",
  ];

  static void _launchUrl() async {
    final Uri uri = Uri.parse(AppConstants.whatsAppUrl);
    if (!await launchUrl(uri)) throw 'حدث خطأ ما';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const BaseDrawer(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Image.asset(
              MyImages.logo,
              height: 150,
            ),
            const SizedBox(height: 20),
            FittedBox(
              child: Row(
                children: [
                  const Text(
                    "لطلب البطاقة عن طريق الواتس آب",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _launchUrl();
                    },
                    child: const Text(
                      "إضغط هنا",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: MyColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Text(
              "بطاقة وتد متوفرة في المكتبات التالية:",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            ListView.separated(
              padding: const EdgeInsets.only(top: 10),
              separatorBuilder: (context, index) => const Divider(
                indent: 20,
                endIndent: 20,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _cities.length,
              itemBuilder: (context, index) {
                return Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    collapsedIconColor: MyColors.text,
                    iconColor: MyColors.text,
                    title: Text(
                      _cities[index],
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    trailing: const CustomArrowWidget(
                      icon: Icons.arrow_downward,
                    ),
                    children: <Widget>[
                      ListTile(
                        leading: Text(
                          'مكتبة ام القرى',
                          style: _tileTextStyle,
                        ),
                        title: Text(
                          'ماركا الشمالية – الشارع الرئيسي بجانب حلويات النجمة – مجمع ابو جاموس التجاري 337',
                          style: _tileTextStyle,
                        ),
                        trailing: Text(
                          '0799852188',
                          style: _tileTextStyle,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
