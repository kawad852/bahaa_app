import 'package:bahaa_app/ui/widgets/custom_app_bar.dart';
import 'package:bahaa_app/utils/base/colors.dart';
import 'package:bahaa_app/utils/base/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InstituteScreen extends StatelessWidget {
  const InstituteScreen({Key? key}) : super(key: key);

  static const String description = "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: Text("المراكز الثقافية"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            description,
            style: TextStyle(
              color: MyColors.greyC7C,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          ListView.separated(
            padding: const EdgeInsets.only(top: 30),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 3,
            separatorBuilder: (context, index) => const Divider(
              indent: 20,
              endIndent: 20,
            ),
            itemBuilder: (context, index) {
              return ListTile(
                title: const Text(
                  "مركز التميز",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  "عمان/الجيبة",
                  style: TextStyle(
                    color: MyColors.grey181,
                  ),
                ),
                trailing: Material(
                  borderRadius: BorderRadius.circular(14),
                  color: MyColors.paige3B2,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(14),
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SvgPicture.asset(
                        MyIcons.location,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
