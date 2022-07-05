import 'package:bahaa_app/ui/base/drawer.dart';
import 'package:bahaa_app/ui/widgets/custom_arrow_widget.dart';
import 'package:bahaa_app/utils/app_constants.dart';
import 'package:bahaa_app/utils/base/colors.dart';
import 'package:bahaa_app/utils/base/images.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  final _tileTextStyle = const TextStyle(fontSize: 10);

  static final _collection = FirebaseFirestore.instance.collection("bookshops");

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

  Widget _shimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: double.infinity,
        height: 75.0,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  static void _launchUrl() async {
    final Uri uri = Uri.parse(AppConstants.whatsAppUrl);
    if (!await launchUrl(uri)) throw 'حدث خطأ ما';
  }

  // @override
  // void initState() {
  //   for (var element in _cities) {
  //     _collection.doc(element).collection("libraries").add({
  //       "name": "مكتبة السعادة",
  //       "address": "عمان",
  //       "phone": "0791595029",
  //     });
  //   }
  //   super.initState();
  // }

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
                  child: FirestoreQueryBuilder<Map<String, dynamic>>(
                    query: _collection.doc(_cities[index]).collection("libraries"),
                    builder: (context, snapshot, _) {
                      if (snapshot.isFetching) {
                        return _shimmer();
                      }

                      if (snapshot.hasError) {
                        return Text('Something went wrong! ${snapshot.error}');
                      }

                      var data = snapshot.docs;
                      return ExpansionTile(
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
                        children: List.generate(
                          data.length,
                          (index) {
                            if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
                              snapshot.fetchMore();
                            }
                            return ListTile(
                              leading: Text(
                                data[index]["name"],
                                style: _tileTextStyle,
                              ),
                              title: Text(
                                data[index]["address"],
                                style: _tileTextStyle,
                              ),
                              trailing: Text(
                                data[index]["phone"],
                                style: _tileTextStyle,
                              ),
                            );
                          },
                        ),
                      );
                    },
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
