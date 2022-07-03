import 'package:bahaa_app/controller/map.dart';
import 'package:bahaa_app/ui/widgets/custom_app_bar.dart';
import 'package:bahaa_app/utils/base/colors.dart';
import 'package:bahaa_app/utils/base/icons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterfire_ui/firestore.dart';

class SchoolsScreen extends StatelessWidget {
  const SchoolsScreen({Key? key}) : super(key: key);

  static const String description = "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.";

  static final _collection = FirebaseFirestore.instance.collection("schools");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        title: Text("المدارس"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            SchoolsScreen.description,
            style: TextStyle(
              color: MyColors.greyC7C,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          FirestoreQueryBuilder<Map<String, dynamic>>(
            query: _collection,
            builder: (context, snapshot, _) {
              if (snapshot.isFetching) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Text('Something went wrong! ${snapshot.error}');
              }

              var data = snapshot.docs;
              return ListView.separated(
                padding: const EdgeInsets.only(top: 30),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.length,
                separatorBuilder: (context, index) => const Divider(
                  indent: 20,
                  endIndent: 20,
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      data[index]["name"],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      data[index]["address"],
                      style: const TextStyle(
                        color: MyColors.grey181,
                      ),
                    ),
                    trailing: Material(
                      borderRadius: BorderRadius.circular(14),
                      color: MyColors.paige3B2,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(14),
                        onTap: () {
                          MapController.openMap(
                            data[index]["longitude"],
                            data[index]["latitude"],
                          );
                        },
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
              );
            },
          ),
        ],
      ),
    );
  }
}
