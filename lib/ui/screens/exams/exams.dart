import 'package:bahaa_app/ui/base/drawer.dart';
import 'package:bahaa_app/ui/widgets/custom_arrow_widget.dart';
import 'package:bahaa_app/utils/app_constants.dart';
import 'package:bahaa_app/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({Key? key}) : super(key: key);

  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
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
            const Text(
              "الإمتحانات المحوسبة",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const Text(
              "أختبر نفسك",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            ListView.separated(
              padding: const EdgeInsets.only(top: 20),
              separatorBuilder: (context, index) => const Divider(
                indent: 20,
                endIndent: 20,
              ),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    _launchUrl(AppConstants.youtubeUrl);
                  },
                  title: Text(
                    'الكيمياء العضوية',
                    style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text(
                    'الكيمياء العضوية',
                    style: TextStyle(
                      color: MyColors.greyC7C,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: const CustomArrowWidget(
                    icon: Icons.north_west,
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
